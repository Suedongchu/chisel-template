package chisellab
import chisel3._
import chisel3.util._

class reg extends Module{
 val io = IO(new Bundle{
 		val in = Input(UInt(1.W))
 		val reg_out = Output(UInt(1.W))
 		val regInit_out = Output(UInt(1.W))
 		val regNext_out = Output(UInt(1.W))
 		val regEnable_out = Output(UInt(1.W))
 		val shiftRegister_out = Output(UInt(1.W))
 		val en  = Input(Bool())
 	}
 )
  val r1 = Reg(UInt(1.W))
  r1 := io.in
  io.reg_out := r1

  val r2 = RegInit(UInt(), 5.U(8.W))
  r2 := io.in
  io.regInit_out := r2

  val r3 = RegNext(r1, 0.U(1.W))
  io.regNext_out := r3

  val r4 = RegEnable(r1, io.en)
  io.regEnable_out := r4

  val r5 = ShiftRegister(io.in, 5)
  io.shiftRegister_out := r5
}

object regVerilog extends App{
  chisel3.Driver.execute(args, () => new reg)
}


// val a = 5.S // signed decimal 4-bit lit from Scala Int
// val b = “b1010”.U // binary 4-bit lit from string
// val c = true.B // Bool lit from Scala lit
// val d = 5.U(8.W) // unsigned decimal 8-bit lit of type UInt
// val e = “h_dead_beef”.U // unsigned 32-bit lit of type UInt

// val wire1 = false.B
// val wire2 = (a & b) | (~c & d)
// val wire3 = wire1 ^ wire2
// wire3 = true.B // not allowed
// val myWire = Wire(UInt(8.W)) // allocate a wire of type UInt, width 8
// myWire := 255.U
// myWire := 0.U // connect to myWire, last one takes effect


// val r1 = Reg(UInt(4.W)) // reg without initialization
// val r2 = RegInit(UInt(), 3.U(8.W)) // initialized to 0 upon reset
// val r3 = RegInit(wire1) // type and width inferred
// val r4 = RegNext(pcNext, 0.U(32.W)) // output a copy of pcNext
// // delayed by one clock cycle
// r3 := next_val // assign to latch new value on next clock

// val rf = Mem(256, UInt(8.W))
// rf(42) := 3.U
// val data = rf(42)


// def clb(a: Bool, b: Bool, c: Bool) = a & b | c
// val out = clb(true.B, some_wire, false.B) // usage

// def wrapAround(n: UInt, max: UInt) =
// Mux(n > max, 0.U, n) // functional module creation

// ● Bundles (structs)
// ● Define a class as a subclass of Bundle
// class MyBundle extends Bundle {
//   val field1 = Bool()
//   val field2 = UInt(8.W)
// }

// val x = Wire(new MyBundle)

// x.field1 := true.B
// val wire1 = x.field1 // true

// class ScaleIO extends Bundle {
//   val valid = Input(Bool())
//   val in = Input(UInt(32.W))
//   val scale = Input(UInt(32.W))
//   val out = Output(UInt(32.W))
// }

// class Mux2 extends Module { // subclass of Module
//   val io = IO(new Bundle { // io port
//   val sel = Input(UInt(1.W))
//   val in0 = Input(UInt(1.W))
//   val in1 = Input(UInt(1.W))
//   val out = Output(UInt(1.W))
// })
//   io.out := (io.sel & io.in1) | (~io.sel & io.in0)
// }


// val myMux2 = Module(new Mux2())
// myMux2.io.sel := 1.U
// myMux2.io.in0 := 1.U
// myMux2.io.in1 := 0.U

// val r1 = Reg(UInt(1.W))
// r1 := myMux2.io.out

// object Mux2 {
//   def apply (sel: UInt, in0: UInt, in1: UInt) = {
//     val m = Module(new Mux2)
//         m.io.in0 := in0
//         m.io.in1 := in1
//         m.io.sel := sel
//         m.io.out // return value
//       }
//   }
// val r1 = Mux2(1.U, 1.U, 0.U) // much simpler

// when (c1) { u1 }
//   .elsewhen (c2) { u2 }
//   .otherwise { ud }
  
// switch (idx) {
//   is(v1) { u1 }
//   is(v2) { u2 }
// }



