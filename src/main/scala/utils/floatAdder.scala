package utils
import chisel3._
import chisel3.util._

class floatAdder(dataWidth: Int, expWidth: Int) extends Module {
  val io = IO(new Bundle {
    val in1 = Input(UInt(dataWidth.W))
    val in2 = Input(UInt(dataWidth.W))
    val out = Output(UInt(dataWidth.W))
  })

  val in1 = parseRawData(expWidth,dataWidth,io.in1)
  val in2 = parseRawData(expWidth,dataWidth,io.in2)
  val out = RegInit(0.U(dataWidth.W))

  when (in1.isNaN || in2.isZero)
    {out := io.in1}
  .elsewhen (in1.isZero || in2.isNaN)
    {out := io.in2}
  .elsewhen (in1.isInf || in2.isInf)
    {out := Cat(in1.sign ^ in2.sign, in1.exp, in1.frag)}
  .otherwise{
    {out := "hffffffff".U}
    /*
    when(in1.exp === in2.exp)
    {
     when (in1.sign == in2.sign)
     {out := Cat(in1.sign, in1.exp, in1.frag + in2.frag)}
    }*/
  }
  //out :=  Cat(sign1,sign2,exp1,exp2,frag1,frag2)
  io.out := out

  def parseRawData(dataWidth: Int, expWidth: Int, in: UInt): RawFloat =
  {
      val exp = in(dataWidth - 2, dataWidth - expWidth - 1)//30-23
      val frag = in(dataWidth - expWidth - 2, 1)//22-0

      val out = Wire(new RawFloat(expWidth, dataWidth))
      out.isNaN  := (exp === 255.asUInt(expWidth.W) && frag =/= 0.asUInt())
      out.isInf  := (exp === 255.asUInt(expWidth.W) && frag === 0.asUInt())
      out.isZero := (exp === 0.asUInt(expWidth.W) && frag === 0.asUInt())
      out.sign   := in(dataWidth - 1)
      out.exp    := exp
      out.sExp   := exp.zext
      out.frag   := frag
      out
  }

 class RawFloat(val expWidth: Int, val dataWidth: Int) extends Bundle
 {
     val isNaN  = Bool()
     val isInf  = Bool()
     val isZero = Bool()
     val sign   = Bool()
     val exp = UInt(expWidth.W)
     val sExp = SInt((expWidth+1).W)//8+1 one for overflow
     val frag  = UInt((dataWidth - expWidth).W)//24 one for overflow

     override def cloneType =
         new RawFloat(expWidth, dataWidth).asInstanceOf[this.type]
 }

}