

set NAME {17-Dec-18}

remove_design -all
exec rm -rf WORK/*

set CLK_PERIOD 0.65
set CELL_LIB sc9_soi12s0_base_svt_ss_nominal_max_0p90v_125c_mxs
set PAD_LIB io_gppr_soi12s0_t18_mv10_mv18_avt_pl_tt_cnom_1p00v_1p80v_25c

# set std cell library
dz_set_pvt [list $CELL_LIB $PAD_LIB]

# ------------------------------------------------------------------------------
# Analyze Design
# ------------------------------------------------------------------------------
analyze -library WORK -format sverilog {/home/msc18h28/ma/RTL/toplevel.sv /home/msc18h28/ma/RTL/serializer.sv /home/msc18h28/ma/RTL/Clock_divider.v}
set TOP_ENTITY {toplevel}
set ENTITY {Serializer}

# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
puts "> elaborate TopLevel"
elaborate $TOP_ENTITY
write -f ddc -o DDC/${ENTITY}_${NAME}_elab.ddc

foreach MAXDELAY {10} {
  puts ""
  puts "---------------------------------------------------------"
  puts "|              Working on ~$TOP_ENTITY~                  |"
  puts "|               Max. Delay is ~$MAXDELAY~               |"
  puts "---------------------------------------------------------"
  puts ""

  #remove_design -design

  read_ddc DDC/${ENTITY}_${NAME}_elab.ddc

  #create_clock clk -period ${MAXDELAY}
  create_clock clk -period ${CLK_PERIOD}
  
  set_max_delay ${MAXDELAY} -from [all_inputs] -to [all_outputs]

  # All inputs are the pads
  set_driving_cell  -no_design_rule -lib_cell ${CELL_LIB} -pin ${PAD_LIB} [remove_from_collection [all_inputs] clk_i]

  # all Outputs have the equivalent load of an output pad
  #set_load [load_of ${LIB}/${LOAD_CELL}/${LOAD_PIN}] [all_outputs]

  compile_ultra -no_autoungroup

  # write verilog netlist
  change_names -rule verilog -hierarchy
  write -format verilog -output ./netlists/${ENTITY}_${NAME}_${MAXDELAY}ns.v -hierarchy

  # write timing information
  write_sdc -nosplit ./netlists/$ENTITY\_synth.sdc
  exec grep -v -E "set_clock_|set_ideal_|create_clock" ./netlists/$ENTITY\_synth.sdc > netlists/$ENTITY\_synth.be.sdc
  write_sdf ./netlists/$ENTITY\_synth.sdf

}


