

# Script for starting Modelsim
# Start Modelsim

vsim-10.5a -t 1ps -lib work -L fse0k_a_memaker_verilog +nospecify -voptargs="+acc" top_tb
