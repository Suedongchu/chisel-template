// See LICENSE for license details.

package dotvisualizer

import chisel3._
import chisel3.experimental.FixedPoint
import org.scalatest.{FreeSpec, Matchers}
import utils.neuronTester.args
import utils.{Neuron, neuronUniTester}


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
    val config = Config(targetDir = "test_run_dir/gcd/", firrtlSource = firrtl, useRanking = true)
    FirrtlDiagrammer.run(config)
  }
}