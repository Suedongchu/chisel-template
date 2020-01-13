package utils
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


object processElementMain extends App {
  iotesters.Driver.execute(args,() => new processElement(16)){
    c => new processElementUniTester(c)
  }
}

object processElementDriver extends App {
  chisel3.Driver.execute(args, () => new processElement(16))
}
