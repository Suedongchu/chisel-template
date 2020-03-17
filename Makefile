PRO=myFifo
CONFIG := PE
.PHONY: Driver Tester Verilog clean

Driver:
	sbt "test:runMain utils.${PRO}Driver"

Tester:
	sbt "test:runMain utils.${PRO}Tester --generate-vcd-output on"

Verilog:
	sbt "test:runMain utils.${CONFIG}Verilog"

clean:
	rm -rf *.json *.v *.fir test_run_dir