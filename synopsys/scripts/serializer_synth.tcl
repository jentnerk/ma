

set NAME {4-Dec-18}

remove_design -all
exec rm -rf WORK/*

# ------------------------------------------------------------------------------
# Analyze Design
# ------------------------------------------------------------------------------
analyze -library WORK -format verilog {/home/msc18h28/ma/RTL/Serializer.v /home/msc18h28/ma/RTL/Clock_divider.v /home/msc18h28/ma/RTL/Toplevel_serializer.v}

set TOP_ENTITY {TopLevel}

# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
puts "> elaborate TopLevel"
elaborate $TOP_ENTITY -architecture verilog -library DEFAULT -update
#write -f ddc -o DDC/${TOP_ENTITY}_${NAME}_elab.ddc

foreach MAXDELAY {10} {
  puts ""
  puts "---------------------------------------------------------"
  puts "|              Working on ~$TOP_ENTITY~                  |"
  puts "|               Max. Delay is ~$MAXDELAY~               |"
  puts "---------------------------------------------------------"
  puts ""

  #remove_design -design
  #read_ddc DDC/${TOP_ENTITY}_${NAME}_elab.ddc

  create_clock clk -period ${MAXDELAY}
  #set_max_delay ${MAXDELAY} -from [all_inputs] -to [all_outputs]

  # All inputs are the pads
  #set_driving_cell  -no_design_rule -library ${LIB} -lib_cell ${DRIV_CELL} -pin ${DRIV_PIN} [remove_from_collection [all_inputs] clk_i]

  # all Outputs have the equivalent load of an output pad
  #set_load [load_of ${LIB}/${LOAD_CELL}/${LOAD_PIN}] [all_outputs]

  #moves the register to retime the design
  #set_optimize_registers true -designs [get_designs div_two_wrapped]

  compile_ultra
}


