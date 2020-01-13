PRO=myFifo

Driver:
	sbt "test:runMain utils.${PRO}Driver"

Tester:
	sbt "test:runMain utils.${PRO}Tester --generate-vcd-output on"


