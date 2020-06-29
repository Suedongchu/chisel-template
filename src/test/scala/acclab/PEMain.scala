package acclab

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class PEUnitTester(c: PE[UInt]) extends PeekPokeTester(c) {
	private val pe = c
	
	poke(pe.io.in_a, 100)
	poke(pe.io.in_b, 2)
	poke(pe.io.in_d, 2)
	poke(pe.io.in_valid, 1)
	poke(pe.io.in_control.dataflow, 1)
	poke(pe.io.in_control.propagate, 1)
	poke(pe.io.in_control.shift, 0)
	step(1)

	poke(pe.io.in_control.propagate, 0)
	expect(pe.io.out_b, 202)

	step(1)

}

object PEMain extends App {
	iotesters.Driver.execute(args, () => new PE[UInt](UInt(32.W), UInt(32.W), UInt(32.W),Dataflow.WS,0)) {
		c => new PEUnitTester(c)
	}
}
