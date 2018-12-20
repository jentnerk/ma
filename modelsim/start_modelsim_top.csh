


# start modelsim (taken from modelsim gui)
vsim-10.6b -lib work -voptargs=+acc shift_serializer_tb;

#do wave2.do;

restart -f; run -all;