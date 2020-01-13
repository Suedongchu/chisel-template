// See README.md for license details.

package utils

import java.io.File

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class fifoUniTester(c: fifo) extends PeekPokeTester(c){

    println("------------------base test started------------------")
    println("fifo's size and width is  "
    +"(" + c.size + ","+c.width + ")")

    //initial test
    expect(c.io.dataOut,0)
    expect(c.io.full,0)
    expect(c.io.empty,1)

    //full test
        for(i <- 1 to c.size by 1){
            poke(c.io.dataIn,i)
            poke(c.io.writeFlag,1)
            poke(c.io.readFlag,0)
            step(1)
            expect(c.io.dataOut,0)
            expect(c.io.full,i==c.size)
            expect(c.io.empty,0)
        }

    //empty test
        for(i <- 1 to c.size by 1){
            poke(c.io.dataIn,0)
            poke(c.io.writeFlag,0)
            poke(c.io.readFlag,1)
            step(1)
            expect(c.io.dataOut,i)
            expect(c.io.full,0)
            expect(c.io.empty,i==c.size)
        }

    //write and read test
        for(i <- 1 to c.size by 1){
            poke(c.io.dataIn,i)
            poke(c.io.writeFlag,1)
            poke(c.io.readFlag,1)
            step(1)
            expect(c.io.dataOut,i)
            expect(c.io.full,0)
            expect(c.io.empty,1)
        }
    println("------------------base test finised------------------")
}