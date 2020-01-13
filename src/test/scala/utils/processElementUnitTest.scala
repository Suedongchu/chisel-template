// See README.md for license details.

package utils

import java.io.File

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class processElementUniTester(c: processElement) extends PeekPokeTester(c){
    
    private val PE = c

    for (i <- 1 to 40 by 2)
    {
        poke(PE.io.iActs,i)
        poke(PE.io.iWeights,i)
        poke(PE.io.iPsum,i)
        step(1)
        expect(PE.io.oPsum,i*i+i)
    }

}