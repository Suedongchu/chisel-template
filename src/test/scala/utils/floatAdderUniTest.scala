// See README.md for license details.

package utils
import chisel3._
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class floatAdderUniTest(c: floatAdder) extends PeekPokeTester(c){

    println("------------------base test started------------------")
  //NaN:x_1111_1111_0...
  //+/- Inf:x_1111_1111_1...
  //Zero: x_0000_0000_0...
    val NaN  = "b1_1111_1111_00000000_00000000_0000000".U
    val Inf  = "b1_1111_1111_10000000_00000000_0000000".U
    val Zero = "b1_0000_0000_00000000_00000000_0000000".U
    poke(c.io.in1,NaN)
    poke(c.io.in2,Zero)
    step(1)
    expect(c.io.out,NaN)
    println("------------------base test finised------------------")
}
