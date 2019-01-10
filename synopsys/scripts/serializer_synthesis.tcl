

set NAME {8.1.19-2}

remove_design -all
exec rm -rf WORK/*

set CELL_LIB sc9_soi12s0_base_svt_ss_nominal_max_0p90v_125c_mxs
set PAD_LIB io_gppr_soi12s0_t18_mv10_mv18_avt_pl_tt_cnom_1p00v_1p80v_25c



# set std cell library
dz_set_pvt [list $CELL_LIB $PAD_LIB]

# ------------------------------------------------------------------------------
# Analyze Design
# ------------------------------------------------------------------------------
analyze -library WORK -format sverilog {/home/msc18h28/ma/sourcecode/toplevel.sv /home/msc18h28/ma/sourcecode/shift_serializer_from_to.sv /home/msc18h28/ma/sourcecode/tree_serializer.sv /home/msc18h28/ma/sourcecode/Clock_divider.v}
set TOP_ENTITY {toplevel}
set ENTITY {Serializer}
# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
elaborate $TOP_ENTITY
write -f ddc -o DDC/${ENTITY}_${NAME}_elab.ddc


#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------
foreach MAXDELAY {0.06} {

  puts ""
  puts "---------------------------------------------------------"
  puts "|              Working on serializer                    |"
  puts "|               Max. Delay is ~$MAXDELAY~               |"
  puts "---------------------------------------------------------"
  puts ""

remove_design -design
read_ddc DDC/${ENTITY}_${NAME}_elab.ddc


# create clocks
create_clock clk -period $MAXDELAY
set_fix_hold clk
#create_generated_clock -name DClkDiv2_clk -divide_by 2 -source $DCLK_SOURCE_PIN [get_pin clkdiv4/area_div0_reg_div2_reg/Q]

# drivers 
#set_driving_cell -no_design_rule -lib_cell ${CELL_LIB} -pin ${PAD_LIB} [remove_from_collection [all_inputs] clk]
#gives the error: Error: Cannot find the specified driving cell in memory.   (UID-993)

# loads
#set_load [load_of ${LIB}/${LOAD_CELL}/${LOAD_PIN}] [all_outputs]

compile_ultra

write -f ddc -h -o DDC/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.ddc

  # get some useful reports
  set REPNAME ${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.rep
  report_timing       >> reports/$REPNAME
  report_area         >> reports/$REPNAME
  check_design        >> reports/REPNAME
  report_design       >> reports/$REPNAME

# write verilog netlist
change_names -rule verilog -hierarchy
write -format verilog -output ./netlists/${ENTITY}${NAME}.v -hierarchy

# write timing information
write_sdc -nosplit ./netlists/$ENTITY\_synth.sdc
exec grep -v -E "set_clock_|set_ideal_|create_clock" ./netlists/$ENTITY\_synth.sdc > netlists/$ENTITY\_synth.be.sdc
write_sdf ./netlists/$ENTITY\_synth.sdf


#extract one path
#report_timing -from Serializer/reg_SP[0] -to dataOut_SP_reg/D
}