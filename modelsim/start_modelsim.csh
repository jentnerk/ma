

##########################################
# start modelsim (taken from modelsim gui)
##########################################

# for the mixed serializer with shift and tree elements
vsim-10.6b -lib work -voptargs=+acc mixed_serializer_tb;

# start only the shifter testbench
# vsim-10.6b -lib work -voptargs=+acc shift_serializer_tb;

# start tree serializer testbench
# vsim-10.6b -lib work -voptargs=+acc tree_serializer_tb;

