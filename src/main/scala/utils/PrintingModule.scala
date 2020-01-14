package utils
import chisel3._
class PrintingModule extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(4.W))
    val out = Output(UInt(4.W))
  })
  io.out := io.in

  printf("Print during simulation: Input is %d\n", io.in)

  printf(p"Print during simulation: IO is $io\n")

  println(s"Print during generation: Input is ${io.in}")
}


