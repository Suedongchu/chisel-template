// See README.md for license details.

package utils

import java.io.File

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class neuronUniTester(c: Neuron) extends PeekPokeTester(c){

    println("------------------base test started------------------")


    val inputs = Seq(Seq(-1, -1), Seq(-1, 1), Seq(1, -1), Seq(1, 1))

    // make this a sequence of two values
    val weights  = Seq(1.0, 1.0)

    // push data through our Neuron and check the result (AND gate)
    reset(5)
    for (i <- inputs) {
        pokeFixedPoint(c.io.in(0), i(0))
        pokeFixedPoint(c.io.in(1), i(1))
        pokeFixedPoint(c.io.weights(0), weights(0))
        pokeFixedPoint(c.io.weights(1), weights(1))
        expectFixedPoint(c.io.out, if (i(0) + i(1) > 0) 1 else 0, "ERROR")
        step(1)
    }
    println("------------------base test finised------------------")
}