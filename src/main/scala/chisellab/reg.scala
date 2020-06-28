package chisellab
import chisel3._
import chisel3.util._

class reg extends Module{
 val io = IO(new Bundle{
 		val in = Input(UInt(1.W))
 		val reg_out = Output(UInt(1.W))
 		val regInit_out = Output(UInt(1.W))
 		val regNext_out = Output(UInt(1.W))
 		val regEnable_out = Output(UInt(1.W))
 		val shiftRegister_out = Output(UInt(1.W))
 		val en  = Input(Bool())
 	}
 )
  val r1 = Reg(UInt(1.W))
  r1 := io.in
  io.reg_out := r1

  val r2 = RegInit(UInt(), 5.U(8.W))
  r2 := io.in
  io.regInit_out := r2

  val r3 = RegNext(r1, 0.U(1.W))
  io.regNext_out := r3

  val r4 = RegEnable(r1, io.en)
  io.regEnable_out := r4

  val r5 = ShiftRegister(io.in, 5)
  io.shiftRegister_out := r5
}

object regVerilog extends App{
  chisel3.Driver.execute(args, () => new reg)
}