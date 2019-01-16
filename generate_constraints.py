#!/usr/bin/env python3

########################################################################################
#
# Generate Constraints script
# Inputs:
#
# 	--number 		- 	Number = {1,2,3} to specify the structure of the serializer
#					   			1 = tree-structured, 2 = shift-structured, 3 = mixed
# 	--output file 	-	File where the constraints will be written into
#
# Outputs:
#	This script will write the needed constraints for the Synposys Design Compiler
#	into the output file.
# 
########################################################################################

#------------------
# Import Libraries
#------------------
import argparse
import sys
import math
import os

parser = argparse.ArgumentParser(description='Generate constraint file for serializer.')

#---------------------------------
# Define Arguments of the Function
#---------------------------------
parser.add_argument('--tree_inputs', type=int, required=True,
                    help='the number of inputs to the tree-structure')
# The Arguments given to the Function will be saved in <<args>>.
args = parser.parse_args(sys.argv[1:])

# Parameter Definition 
n = args.tree_inputs
log_n = int(math.log(n,2))
print(log_n)

#===============================
#	Write the Constraints file
#===============================
with open("synopsys/scripts/constraints_generated.tcl", 'w+') as file:

	# Create Main clock
	#------------------
	file.write("\n#--------------\n# Create Clocks\n#--------------\nset HIGH_SPEED_CLK_PIN clk_i\n")
	file.write("create_clock -period $MAXDELAY $HIGH_SPEED_CLK_PIN\n")
	
	# Create All Divided Clocks
	#--------------------------
	var1 = 2
	file.write("\n#Create the generated clocks\n")
	for x in xrange(1,log_n+1):
		file.write("create_generated_clock -name CLK_DIV_{} -divide_by {} -source $HIGH_SPEED_CLK_PIN [get_pin clk_[{}].clock_divider/clk_div_reg/Q]\n".format(var1,var1,x))
		var1 = var1 * 2
		x += x

	# Fix Holdviolations for All Clocks
	#----------------------------------
	file.write("\n#--------------------------------------\n# fix hold violations for a given clock\n#--------------------------------------\n")
	var2 = log_n
	file.write("set_fix_hold clk_i\n")
	for x in xrange(1,log_n+1):
		file.write("set_fix_hold CLK_DIV_{}\n".format(var2,var2,x))
		var2 = var2 * 2
		x += x

	# Setting for Input and Output
	#-----------------------------
	file.write("\n#-----------------------------------\n# Input and Output Delay Constraints\n#-----------------------------------\n# load of the output is the modulator, worst case it is 10fF\n")
	file.write("set_load 0.01 data_o\n")
	file.write("# constrain the output delay => the delay set here is the additional delay that might come after the dataOut register\n")
	file.write("set_output_delay -clock clk_i -max 0.01 [get_ports data_o]\n")
	file.write("# constrain the input delay => the delay set here\n")
	file.write("set_input_delay -clock CLK_DIV_2 -max 0.01 [get_ports data_i]\n")

#==================================

