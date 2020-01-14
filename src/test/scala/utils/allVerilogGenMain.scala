package utils

object MultiClockModuleVerilog extends App {
  chisel3.Driver.execute(args, () => new MultiClockModule)
}