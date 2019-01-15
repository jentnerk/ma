########################################################
###
### Synthesis Script for Serializer with Tree Structure
###
### Written by: Kaja Jentner
### January 2019
### IEF ETH Zurich
########################################################

#-------------------
# Set Constants
#-------------------
set NAME {}
set PATH {/home/msc18h28/ma/sourcecode/tree_serializer}

remove_design -all
exec rm -rf WORK/*

#-------------------
# Set Libraries
#-------------------
set CELL_LIB sc9_soi12s0_base_svt_ss_nominal_max_0p90v_125c_mxs
set PAD_LIB io_gppr_soi12s0_t18_mv10_mv18_avt_pl_tt_cnom_1p00v_1p80v_25c
dz_set_pvt [list $CELL_LIB $PAD_LIB]

#==============================================================================
# Analyze Design
#==============================================================================
analyze -library WORK -format sverilog $PATH/toplevel_tree_serializer.sv 
analyze -library WORK -format sverilog $PATH/tree_serializer_recursive.sv 
analyze -library WORK -format sverilog $PATH/Clock_divider.sv

# Set Entity To Elaborate
set TOP_ENTITY {toplevel_tree_serializer}
set ENTITY {Serializer}

#==============================================================================
# Elaborate Design
#==============================================================================
elaborate $TOP_ENTITY
write -f ddc -o DDC/${ENTITY}_${NAME}_elab.ddc

set MAXDELAY 0.05

remove_design -design
read_ddc DDC/${ENTITY}_${NAME}_elab.ddc

#set_max_delay, set _min_delay: for asynchronous paths (beruecksichtigt verschiedene clockdomains, 
# nur most critical path wird verbessert, wird durch group_path beinflusst)

# Create Clocks
set HIGH_SPEED_CLK_PIN clk_i
create_clock -period $MAXDELAY $HIGH_SPEED_CLK_PIN
create_generated_clock -name CLK_DIV_2 -divide_by 2 -source $HIGH_SPEED_CLK_PIN [get_pin clk_[1].clock_divider/clk_div_o]
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

#==============================================================================
# Compile Design 
#==============================================================================
compile_ultra -no_autoungroup
