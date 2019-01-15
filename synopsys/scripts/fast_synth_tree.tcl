

set NAME {}
set PATH {/home/msc18h28/ma/sourcecode/tree_serializer}

remove_design -all
exec rm -rf WORK/*

set CELL_LIB sc9_soi12s0_base_svt_ss_nominal_max_0p90v_125c_mxs
set PAD_LIB io_gppr_soi12s0_t18_mv10_mv18_avt_pl_tt_cnom_1p00v_1p80v_25c



# set std cell library
dz_set_pvt [list $CELL_LIB $PAD_LIB]

# ------------------------------------------------------------------------------
# Analyze Design
# ------------------------------------------------------------------------------
analyze -library WORK -format sverilog $PATH/toplevel_tree_serializer.sv 
analyze -library WORK -format sverilog $PATH/tree_serializer_recursive.sv 
analyze -library WORK -format sverilog $PATH/Clock_divider.sv

set TOP_ENTITY {toplevel_tree_serializer}
set ENTITY {Serializer}

# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
elaborate $TOP_ENTITY

write -f ddc -o DDC/${ENTITY}_${NAME}_elab.ddc

set MAXDELAY 0.05

remove_design -design
read_ddc DDC/${ENTITY}_${NAME}_elab.ddc

# commands found in documentation

#create_clock : for synchronous paths

#set_max_delay, set _min_delay: for asynchronous paths (beruecksichtigt verschiedene clockdomains, 
# nur most critical path wird verbessert, wird durch group_path beinflusst)

# create clocks
set HIGH_SPEED_CLK_PIN clk_i
create_clock -period ${MAXDELAY} $HIGH_SPEED_CLK_PIN
create_generated_clock -name CLK_DIV_2 -divide_by 2 -source $HIGH_SPEED_CLK_PIN [get_pin clk_[1].clock_divider/clk_div_o]
create_generated_clock -name CLK_DIV_4 -divide_by 4 -source clk_[1].clock_divider/clk_div_o [get_pin clk_[2].clock_divider/clk_div_o]

# fix hold violations for a given clock
set_fix_hold clk_i
set_fix_hold CLK_DIV_2
set_fix_hold CLK_DIV_4

# load of the output is the modulator, worst case it is 10fF. This command will insert a Buffer that represents the 
# set load.
set_load 0.01 data_o
# since the output is however not constrained no timing violation will come from this applied load
# U8 is the buffer that has been inserted by synopsys
#set_max_delay ${MAXDELAY} -to U8/Y 
# to check the influence of the load you can use
#report_timing -from dataOut_SP_reg/Q -to data_o
#compile_ultra

