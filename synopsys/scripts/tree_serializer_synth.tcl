

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
analyze -library WORK -format sverilog $PATH/tree_serializer_plane.sv 
analyze -library WORK -format sverilog $PATH/Clock_divider.sv

set TOP_ENTITY {toplevel_tree_serializer}
set ENTITY {Serializer}

# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
elaborate $TOP_ENTITY
write -f ddc -o DDC/${ENTITY}_${NAME}_elab.ddc

#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------
#foreach MAXDELAY {1} {
set MAXDELAY 1

  puts ""
  puts "---------------------------------------------------------"
  puts "|              Working on serializer                    |"
  puts "|               Max. Delay is ~$MAXDELAY~               |"
  puts "---------------------------------------------------------"
  puts ""

remove_design -design
read_ddc DDC/${ENTITY}_${NAME}_elab.ddc

# commands found in documentation

#create_clock : for synchronous paths

#set_max_delay, set _min_delay: for asynchronous paths (beruecksichtigt verschiedene clockdomains, 
# nur most critical path wird verbessert, wird durch group_path beinflusst)

# set-fix-hold auf true setzen, um hold violations zu korrigieren

#set_driving_cell
#set_load


# create clocks
set HIGH_SPEED_CLK_PIN clk
create_clock -period ${MAXDELAY} $HIGH_SPEED_CLK_PIN
# set CLK_DIV2 [get_pin genblk1[0].Clock_divider/clkB_reg/Q]
# set CLK_DIV2 [get_nets clk[1]]
create_generated_clock -name CLK_DIV2 -divide_by 2 -source $HIGH_SPEED_CLK_PIN [get_pin clock[0].divider/clkB_reg/Q]

# drivers 
#set_driving_cell -no_design_rule -lib_cell ${CELL_LIB} -pin ${PAD_LIB} [remove_from_collection [all_inputs] clk]
#gives the error: Error: Cannot find the specified driving cell in memory.   (UID-993)

# load of the output is the modulator, worst case it is 10fF. This command will insert a Buffer that represents the 
# set load.
set_load 0.01 data_o
# since the output is however not constrained no timing violation will come from this applied load
# U8 is the buffer that has been inserted by synopsys
set_max_delay ${MAXDELAY} -to U8/Y 
# to check the influence of the load you can use
#report_timing -from dataOut_SP_reg/Q -to data_o
compile_ultra

write -f ddc -h -o DDC/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.ddc

  # get some useful reports
  set REPNAME ${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.rep
  report_timing       >> reports/$REPNAME
  report_area         >> reports/$REPNAME
  check_design        >> reports/$REPNAME
  report_design       >> reports/$REPNAME

# write verilog netlist
change_names -rule verilog -hierarchy
write -format verilog -output ./netlists/${ENTITY}${NAME}.v -hierarchy

# write timing information
write_sdc -nosplit ./netlists/$ENTITY\_synth.sdc
exec grep -v -E "set_clock_|set_ideal_|create_clock" ./netlists/$ENTITY\_synth.sdc > netlists/$ENTITY\_synth.be.sdc
write_sdf ./netlists/$ENTITY\_synth.sdf

#}