

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

#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------
#foreach MAXDELAY {0.05} {
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
  create_generated_clock -name CLK_DIV_2 -divide_by 2 -source $HIGH_SPEED_CLK_PIN [get_pin clk_[1].clock_divider/clk_div_reg/Q]

  # fix hold violations for a given clock
 # set_fix_hold clk_i
 # set_fix_hold CLK_DIV_2

  # load of the output is the modulator, worst case it is 10fF. This command will insert a Buffer that represents the 
  # set load.
  set_load 0.01 data_o
  # constrain the output delay => the delay set here is the additional delay that might come after the dataOut register
  set_output_delay -clock clk_i -max 0.01 [get_ports data_o]
  # constrain the input delay => the delay set here
  set_input_delay -clock CLK_DIV_4 -max 0.01 [get_ports data_i]
  # to check the influence of the load you can use
  #report_timing -from dataOut_SP_reg/Q -to data_o

  #---------------------------------------------------------------------------------
  # Compile Design 
  #---------------------------------------------------------------------------------
  compile_ultra



  #---
  # commands to check timing conditions of all paths (only works for noautoungroup)
  #---
  # path from clockdivider to output FF
  report_timing -from clk_[1].clock_divider/clk_div_o -to dataOut_SN
  # path from input FF[1] to output FF
  report_timing -from Serializer/reg_SP_reg[1]/QN -to dataOut_SN
  # path from input FF[0] to output FF
  report_timing -from Serializer/reg_SP_reg[0]/QN -to dataOut_SN
  # path from clockdivider to clockdivider (over inverter)
  report_timing -from clk_[1].clock_divider/clk_div_reg/Q -to clk_[1].clock_divider/clk_div_reg/D


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

}