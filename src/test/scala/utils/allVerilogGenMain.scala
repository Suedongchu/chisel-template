package utils

import gemmini._
import chisel3._
import chisel3.util.log2Up
import gemmini.Util.UDValid


object MultiClockModuleVerilog extends App {
  chisel3.Driver.execute(args, () => new MultiClockModule)
}

object PEVerilog extends App {
  chisel3.Driver.execute(args, () => new PE[UInt](UInt(1.W), UInt(1.W), UInt(1.W),Dataflow.WS,1))
}

object TileVerilog extends App{
  chisel3.Driver.execute(args, () => new  Tile[UInt](UInt(1.W), UInt(1.W), UInt(1.W), Dataflow.WS, 1, 2, 2))
}

object MeshVerilog extends App{
  chisel3.Driver.execute(args, () => new Mesh[UInt](UInt(32.W), UInt(32.W), UInt(32.W),
    Dataflow.WS, 1,
    2, 2,
  2, 2) )
}

object MeshWithDelaysVerilog extends App{

  //defaultConfig
  val tileRows = 1
  val tileColumns = 1
  val meshRows = 16
  val meshColumns = 16
  val ld_queue_length = 8
  val st_queue_length = 2
  val ex_queue_length = 8
  val rob_entries = 16
  val sp_banks = 4
  val acc_banks = 1
  val sp_capacity = CapacityInKilobytes(256)
  val shifter_banks = 1 // TODO add separate parameters for left and up shifter banks
  val dataflow = Dataflow.BOTH
  val acc_capacity = CapacityInKilobytes(64)
  val mem_pipeline = 1
  val dma_maxbytes = 64 // TODO get this from cacheblockbytes
  val dma_buswidth = 128 // TODO get this from SystemBusKey
  val aligned_to = 1
  val inputType = SInt(8.W)
  val outputType = SInt(19.W)
  val accType = SInt(32.W)
  val pe_latency = 0

  val sp_width = meshColumns * tileColumns * inputType.getWidth
  val sp_bank_entries = sp_capacity match {
    case CapacityInKilobytes(kb) => kb * 1024 * 8 / (sp_banks * sp_width)
//    case CapacityInMatrices(ms) => ms * meshRows * tileRows / sp_banks
  }
  val acc_bank_entries = acc_capacity match {
    case CapacityInKilobytes(kb) => kb * 1024 * 8 / (acc_banks * meshColumns * tileColumns * accType.getWidth)
//    case CapacityInMatrices(ms) => ms * meshRows * tileRows / acc_banks
  }
  val local_addr_t = new LocalAddr(sp_banks, sp_bank_entries, acc_banks, acc_bank_entries)

  val block_size = meshRows*tileRows

  val mesh_tag = new Bundle with TagQueueTag {
    val rob_id = UDValid(UInt(log2Up(rob_entries).W))
    val addr = local_addr_t.cloneType
    val rows = UInt(log2Up(block_size + 1).W)
    val cols = UInt(log2Up(block_size + 1).W)

    override def make_this_garbage(dummy: Int = 0): Unit = {
      rob_id.valid := false.B
      addr.make_this_garbage()
    }
  }

  chisel3.Driver.execute(args, () => new MeshWithDelays(inputType, outputType, accType, mesh_tag, dataflow, pe_latency,
    tileRows, tileColumns, meshRows, meshColumns, shifter_banks, shifter_banks)
  )

}