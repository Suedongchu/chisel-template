package accelerator
import chisel3._
import chisel3.util
import chisel3.util.{RegEnable, ShiftRegister, log2Up}

class PEControl[T <: Data : Arithmetic](accType: T) extends Bundle {
  val dataflow = UInt(1.W)
  val propagate = UInt(1.W)
  val shift = UInt(log2Up(accType.getWidth).W)

}
class PE[T <: Data](inputType: T, outputType: T, accType: T, df: Dataflow.Value, latency: Int)
                    (implicit  ev: Arithmetic[T]) extends Module{
  import ev._ //use mac

  val io = IO(new Bundle{
    val in_a = Input(inputType)
    val in_b = Input(outputType)
    val in_d = Input(outputType)
    val out_a = Output(inputType)
    val out_b = Output(outputType)
    val out_c = Output(outputType)

    val in_control = Input(new PEControl(accType))
    val out_control = Output(new PEControl(accType))

    val in_valid = Input(Bool())
    val out_valid = Output(Bool())
  })
  val cType = if (df == Dataflow.WS) inputType else accType //Type choice

  val a = ShiftRegister(io.in_a, latency) //a is weight or feature
  val b = ShiftRegister(io.in_b, latency) //a is weight or feature
  val d = ShiftRegister(io.in_d, latency) //a is weight or feature
  val c1 = Reg(cType) //c is the acculator
  val c2 = Reg(cType) //c is the acculator
  val dataflow = ShiftRegister(io.in_control.dataflow, latency)
  val prop = ShiftRegister(io.in_control.propagate, latency) //is propagate?
  val shift = ShiftRegister(io.in_control.shift, latency)
  val valid = ShiftRegister(io.in_valid, latency)

  io.out_a := a //just delay for cycles
  io.out_control.dataflow := dataflow //interface out
  io.out_control.propagate := prop
  io.out_control.shift := shift
  io.out_valid := valid

  val last_s = RegEnable(prop, valid) //propagate control by valid
  val flip = last_s =/= prop
  val shift_offset = Mux(flip, shift, 0.U) //if flip then return shift

  val OUTPUT_STATIONARY = Dataflow.OS.id.U(1.W)
  val WEIGHT_STATIONARY = Dataflow.WS.id.U(1.W)

  //need to change for WS or OS
  val COMPUTE = 0.U(1.W)
  val PROPAGATE = 1.U(1.W)



}
