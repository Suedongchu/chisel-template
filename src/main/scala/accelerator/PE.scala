package accelerator
import chisel3._
import chisel3.util
import chisel3.util.log2Up

class PEControl[T <: Data : Arithmetic](accType: T) extends Bundle {
  val dataflow = UInt(1.W)
  val propagate = UInt(1.W)
  val shift = UInt(log2Up(accType.getWidth).W)

}
class PE {

}
