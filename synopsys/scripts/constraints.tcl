########################################################
###
### Constraints for the tree-structured Serializer.
###
### Written by: Kaja Jentner
### January 2019
### IEF ETH Zurich
########################################################

#--------------
# Create Clocks
#--------------
set HIGH_SPEED_CLK_PIN clk_i
create_clock -period $MAXDELAY $HIGH_SPEED_CLK_PIN

create_generated_clock -name CLK_DIV_2 -divide_by 2 -source $HIGH_SPEED_CLK_PIN [get_pin clk_[1].clock_divider/clk_div_reg/Q]
#create_generated_clock -name CLK_DIV_4 -divide_by 4 -source clk_[1].clock_divider/clk_div_o [get_pin clk_[2].clock_divider/clk_div_o]

#--------------------------------------
# fix hold violations for a given clock
#--------------------------------------
set_fix_hold clk_i
set_fix_hold CLK_DIV_2
#set_fix_hold CLK_DIV_4

#-----------------------------------
# Input and Output Delay Constraints
#-----------------------------------
# load of the output is the modulator, worst case it is 10fF
set_load 0.01 data_o
# constrain the output delay => the delay set here is the additional delay that might come after the dataOut register
set_output_delay -clock clk_i -max 0.01 [get_ports data_o]
# constrain the input delay => the delay set here
set_input_delay -clock CLK_DIV_2 -max 0.01 [get_ports data_i]
