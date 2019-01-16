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



#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------
foreach MAXDELAY {0.05} {

  remove_design -design
  read_ddc DDC/${ENTITY}_${NAME}_elab.ddc

  #------------------
  # Load Constraints
  #------------------
  source scripts/constraints.tcl

  #==============================================================================
  # Compile Design 
  #==============================================================================
  compile_ultra -no_autoungroup

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