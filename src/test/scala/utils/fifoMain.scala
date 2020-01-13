package utils
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}


object myFifoTester extends App {


  for(i<- 2 to 10 by 1)
    for(j<- 16 to 32 by 1)
    {
        iotesters.Driver.execute(args,() => new fifo(i,j)){
          c => new fifoUniTester(c)
        }
    }

}

object myFifoDriver extends App {
  chisel3.Driver.execute(args, () => new fifo(8,16))
}