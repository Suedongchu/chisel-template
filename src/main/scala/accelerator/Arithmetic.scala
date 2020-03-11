package accelerator

import chisel3._
import chisel3.util
import chisel3.util.MuxCase
import hardfloat._

abstract class Arithmetic[T : Data] {
  implicit def  cast(t: T): ArithmeticOps[T]

}

abstract class ArithmeticOps[T : Data](self: T){
  //reload operator define
  def mac(m1: T, m2: T): T
  def +(t: T): T
  def >>(u: UInt): T
  def withWidthOf(t: T)
  def clippedToWidthOf(t: T): T
  def relu: T
  def relu6(shift: UInt): T
}

object Arithmetic{

   //fot UInt
  implicit object UIntArithmetic extends Arithmetic[UInt]{
    override implicit def cast(self: UInt) = new ArithmeticOps(self) {
      override def mac(m1: UInt, m2: UInt): UInt = m1 * m2 + self

      override def +(t: UInt): UInt = self + t

      override def >>(u: UInt): UInt = {
        val point_five = Mux(u === 0.U, 0.U, self(u - 1.U))
        val zeros = Mux(u <= 1.U ,0.U, self.asUInt() & ((1.U << (u - 1.U)).asUInt() - 1.U)) =/= 0.U
        val ones_digit = self(u)
        val r = point_five & (zeros | ones_digit)
        (self >> u).asUInt() + r
      }

      override def withWidthOf(t: UInt): Unit = self(t.getWidth-1, 0)

      override def clippedToWidthOf(t: UInt): UInt = {
        val sat = ((1 << (t.getWidth - 1))-1).U
        Mux(self > sat, sat, self)(t.getWidth - 1, 0)
      }

      override def relu: UInt = self

      override def relu6(shift: UInt): UInt = {
        val max6 = (6.U << shift).asUInt()
        val maxWidth = ((1 << (self.getWidth - 1))-1).U
        //return the smaller one
        val max = Mux(max6 > maxWidth, maxWidth, max6)(self.getWidth - 1, 0).asUInt()
        Mux(self < max, self, max)
      }
    }

    //for SInt
  implicit object SIntArithmetic extends Arithmetic[SInt]{
      override implicit def cast(self: SInt): ArithmeticOps[SInt] = new ArithmeticOps(self) {
        override def mac(m1: SInt, m2: SInt): SInt = m1 * m2 + self

        override def +(t: SInt): SInt = self + t

        override def >>(u: UInt): SInt = {
          // The equation we use can be found here: https://riscv.github.io/documents/riscv-v-spec/#_vector_fixed_point_rounding_mode_register_vxrm

          // TODO Do we need to explicitly handle the cases where "u" is a small number (like 0)? What is the default behavior here?
          val point_five = Mux(u === 0.U, 0.U, self(u - 1.U))
          val zeros = Mux(u <= 1.U, 0.U, self.asUInt() & ((1.U << (u - 1.U)).asUInt() - 1.U)) =/= 0.U
          val ones_digit = self(u)

          val r = (point_five & (zeros | ones_digit)).asBool()

          (self >> u).asSInt() + Mux(r, 1.S, 0.S)
        }

        //get the data[t-1:0]
        override def withWidthOf(t: SInt) = self(t.getWidth-1, 0).asSInt()

        override def clippedToWidthOf(t: SInt): SInt = {
          val maxsat = ((1 << (t.getWidth - 1))- 1).S
          val minsat = (-(1 << (t.getWidth - 1))).S
          MuxCase(self, Seq((self > maxsat) -> maxsat, (self < minsat) -> minsat))(t.getWidth-1, 0).asSInt()
        }

        override def relu: SInt = Mux(self >= 0.S, self, 0.S)

        override def relu6(shift: UInt): SInt = {
          val max6 = (6.S << shift).asSInt()
          val maxWidth = ((1 << (self.getWidth - 1))-1).S
          val max = Mux(max6 > maxWidth,  maxWidth, max6)(self.getWidth - 1, 0).asSInt()
          MuxCase(self, Seq((self < 0.S) -> 0.S, (self > max) -> max))
        }
      }
    }
  }
}