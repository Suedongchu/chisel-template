PRO=myFifo
CONFIG := PE
SBT ?= sbt -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080

.PHONY: Driver Tester Verilog clean

Driver:
	$(SBT) "test:runMain utils.${PRO}Driver"

Tester:
	$(SBT) "test:runMain utils.${PRO}Tester --generate-vcd-output on"

Verilog:
	$(SBT) "test:runMain utils.${CONFIG}Verilog"

clean:
	rm -rf *.json *.v *.fir test_run_dir