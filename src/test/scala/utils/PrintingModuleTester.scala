package utils

import chisel3.iotesters.PeekPokeTester

class PrintingModuleTester(c: PrintingModule) extends PeekPokeTester(c) {
  poke(c.io.in, 3)
  step(5) // circuit will print

  println(s"Print during testing: Input is ${peek(c.io.in)}")
}
