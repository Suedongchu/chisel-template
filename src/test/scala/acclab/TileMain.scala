package acclab

import chisel3._
import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class TileUniTester(c: Tile[UInt]) extends PeekPokeTester(c) {
	private val tile = c
	// val B = List(List(20, 30), List(40, 50))

	// // Print elements.
	// println(elements(0)(0).toString)
	val A = List(
					List(1,0,0,0),
					List(2,1,0,0),
					List(3,2,1,0),
					List(4,3,2,1),
					List(0,4,3,2),
					List(0,0,4,3),
					List(0,0,0,4),
					List(0,0,0,0),
					List(0,0,0,0),
					List(0,0,0,0),
					List(0,0,0,0)
				)

	val B = List(
					List(1,5,9,13),
					List(2,6,10,14),
					List(3,7,11,15),
					List(4,8,12,16)
				)

	val C = List(
					List(10,0,0,0),
					List(20,26,0,0),
					List(30,52,42,0),
					List(40,78,84,58),
					List(0,104,126,116),
					List(0,0,168,174),
					List(0,0,0,232),
					List(0,0,0,0),
					List(0,0,0,0),
					List(0,0,0,0),
					List(0,0,0,0)
					// List(10,26,42,58),
					// List(20,52,84,116),
					// List(30,78,126,174),
					// List(40,104,168,232)
				)

	// propagate weight B
	for (i <- 0 to 3){
		for (j <- 0 to 3){
			poke(tile.io.in_d(j), B(3-i)(j))
			poke(tile.io.in_valid(j), 1)
			poke(tile.io.in_control(j).dataflow, 1)
			poke(tile.io.in_control(j).propagate, 1)
			poke(tile.io.in_control(j).shift, 0)
		}
		step(1)
	}

	val sumCount = 3
	// propagate A and compute
	for (i <- 0 to 10){
		for (j <- 0 to 3){
			poke(tile.io.in_a(j), A(i)(j))
			poke(tile.io.in_valid(j), 1)
			poke(tile.io.in_control(j).dataflow, 1)
			poke(tile.io.in_control(j).propagate, 0)
			poke(tile.io.in_control(j).shift, 0)
		}
		step(1)
		if(i >= sumCount){
			for(k <- 0 to 3)
				expect(tile.io.out_b(k), C(i-sumCount)(k))
		}
	}
	step(4)
}


object TileMain extends App{
	iotesters.Driver.execute(args, () => new Tile[UInt](UInt(32.W), UInt(32.W), UInt(32.W), Dataflow.WS, 1, 4, 4)) {
		c => new TileUniTester(c)
	}
}

object TileVerilog extends App{
	chisel3.Driver.execute(args, () => new Tile[UInt](UInt(32.W), UInt(32.W), UInt(32.W), Dataflow.WS, 0, 4, 4))
}