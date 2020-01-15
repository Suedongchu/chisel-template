// See LICENSE for license details.

package dotvisualizer

import chisel3._
import chisel3.experimental.FixedPoint
import org.scalatest.{FreeSpec, Matchers}
import utils.neuronTester.args
import utils.{FIRFilterGenerator, FirFilter, MultiClockModule, Neuron, fifo, neuronUniTester}


class GCDViewer extends FreeSpec with Matchers {
  "GCD circuit to visualize" in {
    val circuit = chisel3.Driver.elaborate(() => new GCD)
    val firrtl = chisel3.Driver.emit(circuit)
    val config = Config(targetDir = "test_run_dir/gcd/", firrtlSource = firrtl, useRanking = true)
    FirrtlDiagrammer.run(config)
  }
}

class neuronViewer extends FreeSpec with Matchers {
  val Step: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), 1.F(8.BP))
  val ReLU: FixedPoint => FixedPoint = x => Mux(x <= 0.F(8.BP), 0.F(8.BP), x)
  "Neuron circuit to visualize" in {
    val circuit = chisel3.Driver.elaborate(() => new Neuron(2, Step))
    val firrtl = chisel3.Driver.emit(circuit)
    val config = Config(targetDir = "test_run_dir/Neuron/", firrtlSource = firrtl, useRanking = true)
    FirrtlDiagrammer.run(config)
  }
}

class fifoViewer extends FreeSpec with Matchers {
  "fifo circuit to visualize" in {
    val circuit = chisel3.Driver.elaborate(() => new fifo(8,16))
    val firrtl = chisel3.Driver.emit(circuit)
    val config = Config(targetDir = "test_run_dir/fifo/", firrtlSource = firrtl, useRanking = true)
    FirrtlDiagrammer.run(config)
  }
}

class FirFilterViewer extends FreeSpec with Matchers {
  "fifo circuit to visualize" in {
    val circuit = chisel3.Driver.elaborate(() => new FirFilter(8, Seq(1.U, 2.U, 3.U, 2.U, 1.U)))
    val firrtl = chisel3.Driver.emit(circuit)
    val config = Config(targetDir = "test_run_dir/FirFilter/", firrtlSource = firrtl, useRanking = true)
    FirrtlDiagrammer.run(config)
  }
}

class MultiClockModuleViewer extends FreeSpec with Matchers {
  "MultiClockModule circuit to visualize" in {
    val circuit = chisel3.Driver.elaborate(() => new MultiClockModule)
    val firrtl = chisel3.Driver.emit(circuit)
    val config = Config(targetDir = "test_run_dir/MultiClockModule/", firrtlSource = firrtl, useRanking = true)
    FirrtlDiagrammer.run(config)
  }
}

class FIRFilterGeneratorViewer extends FreeSpec with Matchers {
  "FIRFilterGenerator circuit to visualize" in {
    val circuit = chisel3.Driver.elaborate(() => new FIRFilterGenerator(8))
    val firrtl = chisel3.Driver.emit(circuit)
    val config = Config(targetDir = "test_run_dir/FIRFilterGenerator/", firrtlSource = firrtl, useRanking = true)
    FirrtlDiagrammer.run(config)
  }
}