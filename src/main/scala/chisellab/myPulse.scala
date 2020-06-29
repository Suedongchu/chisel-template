package chisellab

import chisel3._
import chisel3.util._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class myPulse(maxVlue: UInt) extends Module {
	val io = IO(new Bundle{
		val out = Output(UInt(1.W))
	})

	def counter(max: UInt) = {
		val x = RegInit(UInt(), 0.U(max.getWidth.W))
		x := Mux(x === max, 0.U, x + 1.U)
		x
	}

	// Produce pulse every n cycles.
	def pulse(n: UInt) = counter(n - 1.U) === 0.U

	val p1 = pulse(maxVlue)

	io.out := p1
}

object myPulseVerilog extends App{
  chisel3.Driver.execute(args, () => new myPulse(50.U))
}


class myPulseTester(c: myPulse) extends PeekPokeTester(c) {
	private val pulse = c
	
	step(100)

}

object myPulseMain extends App {
	iotesters.Driver.execute(args, () => new myPulse(50.U)) {
		c => new myPulseTester(c)
	}
}

