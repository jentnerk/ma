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
set PATH {/home/msc18h28/ma/sourcecode/shift_serializer}

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
analyze -library WORK -format sverilog $PATH/shift_serializer.sv

# Set Entity To Elaborate
set TOP_ENTITY {shift_serializer}
set ENTITY {Shift_Serializer}

#==============================================================================
# Elaborate Design
#==============================================================================
elaborate $TOP_ENTITY
write -f ddc -o DDC/${ENTITY}_${NAME}_elab.ddc


remove_design -design
read_ddc DDC/${ENTITY}_${NAME}_elab.ddc



#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------
foreach MAXDELAY {1 0.1 0.05} {


  remove_design -design
  read_ddc DDC/${ENTITY}_${NAME}_elab.ddc

  create_clock -period $MAXDELAY clk
  set_fix_hold clk
  set_load 0.01 data_o
  # set_output_delay -clock clk_i -max 0.01 [get_ports data_o]
  # set_input_delay -clock clk_i -max 0.01 [get_ports data_i]

  #==============================================================================
  # Compile Design 
  #==============================================================================
  compile_ultra -no_autoungroup

  write -f ddc -h -o DDC/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.ddc

    # get some useful reports
    set REPNAME ${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.rep
    report_timing       >> reports/$REPNAME
    report_area         >> reports/$REPNAME
    check_design        >> reports/$REPNAME
    report_design       >> reports/$REPNAME

  # write verilog netlist
  change_names -rule verilog -hierarchy
  write -format verilog -output ./netlists/${ENTITY}${NAME}_${MAXDELAY}ns.v -hierarchy

  # write timing information
  write_sdc -nosplit ./netlists/${ENTITY}_${MAXDELAY}ns\_synth.sdc
  exec grep -v -E "set_clock_|set_ideal_|create_clock" ./netlists/${ENTITY}_${MAXDELAY}ns\_synth.sdc > netlists/${ENTITY}_${MAXDELAY}ns\_synth.be.sdc
  write_sdf ./netlists/${ENTITY}_${MAXDELAY}ns\_synth.sdf

}