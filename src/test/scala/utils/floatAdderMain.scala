package utils
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._

object floatAdderMain extends App {
  iotesters.Driver.execute(args,() => new floatAdder(32,8)){
    c => new floatAdderUniTest(c)
  }
}