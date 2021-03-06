package utils
import chisel3._
import chisel3.util._
import chisel3.experimental._
class  Neuron(inputs: Int, act: FixedPoint => FixedPoint) extends Module {
  val io = IO(new Bundle {
    val in      = Input(Vec(inputs, FixedPoint(16.W, 8.BP)))
    val weights = Input(Vec(inputs, FixedPoint(16.W, 8.BP)))
    val out     = Output(FixedPoint(16.W, 8.BP))
  })

  val mac = io.in.zip(io.weights).map{ case(a:FixedPoint, b:FixedPoint) => a*b}.reduce(_+_)
  io.out := act(mac)
}