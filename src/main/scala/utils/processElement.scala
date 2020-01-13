// See README.md for license details.

package utils

import chisel3._

/**
  * Compute GCD using subtraction method.
  * Subtracts the smaller from the larger until register y is zero.
  * value in register x is then the GCD
  */
class processElement(width : Int) extends Module {
  val io = IO(new Bundle {
    val iActs       = Input(UInt(width.W))
    val iPsum       = Input(UInt(width.W))
    val iWeights    = Input(UInt(width.W))
    val oPsum       = Output(UInt(width.W))
  })

  io.oPsum := io.iActs * io.iWeights + io.iPsum //all is wire and assign 
}
