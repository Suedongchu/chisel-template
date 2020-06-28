PRO=myFifo
MODULE := reg
PACKAGE ?= chisellab
SBT ?= sbt -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080

.PHONY: Driver Tester Verilog clean

# Driver:
# 	$(SBT) "test:runMain utils.${PRO}Driver"

tester:
	$(SBT) "test:runMain $(PACKAGE).${MODULE}Main --generate-vcd-output on"

verilog:
	$(SBT) "test:runMain $(PACKAGE).${MODULE}Verilog"

upload:clean
	git add . && git commit -m 'auto push by makefile' && git push 

clean:
	rm -rf *.json *.v *.fir test_run_dir