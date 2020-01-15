package utils
import chipsalliance.rocketchip.config.Parameters
import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.experimental._
import dspblocks.AXI4StandaloneBlock
import freechips.rocketchip.diplomacy.LazyModule

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

object neuronTester extends App {
  val Step: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), 1.F(8.BP))
  val ReLU: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), x)

      iotesters.Driver.execute(args,() => new Neuron(2, Step)){
        c => new neuronUniTester(c)
      }
}

object printMduleTester extends App {
  chisel3.iotesters.Driver( () => new PrintingModule ) { c => new PrintingModuleTester(c) }
}

object arbiterTester extends App {
  iotesters.Driver.execute(args,() => new Arbiter){
    c => new ArbiterTester(c)
  }
}

object fsmExampleTester extends App {
  iotesters.Driver.execute(args,() => new FSMexample){
    c => new FSMexampleTester(c)
  }
}
