package chisellab
import chisel3._

class reg extends Module{
 val io = IO(new Bundle{
 		val in = Input(UInt(1.W))
 		val out = Output(UInt(1.W))
 	}
 )
  val r = Reg(UInt(1.W))
  r := io.in
  io.out := r
}

object regVerilog extends App{
  chisel3.Driver.execute(args, () => new reg)
}