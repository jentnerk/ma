

set NAME {14-Dec-18}



####################################################
#---------------------------------------------------
# serializer with different timing constraints
#---------------------------------------------------
####################################################

#****** libraries for DesignWare components synthesis ******
set synthetic_library [concat  $synthetic_library dw_foundation.sldb]
set link_library      [concat  $link_library      dw_foundation.sldb]

########################
# set up some vars
########################
remove_design -all
exec rm -rf WORK/*

# Use all the CPU cores
set_host_options -max_cores 8


# use worst case library
# for driving and load
#set LIB uk65lscllmvbbl_108c125_wc
#set DRIV_CELL BUFM4W
#set DRIV_PIN  Z
#set LOAD_CELL BUFM4W
#set LOAD_PIN  A

# ------------------------------------------------------------------------------
# Analyze Design
# ------------------------------------------------------------------------------
analyze -library WORK -format sverilog {/home/msc18h28/ma/rtl/toplevel.sv}

set TOP_ENTITY {toplevel}


# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
puts "> elaborate toplevel"
elaborate $TOP_ENTITY -architecture verilog -library DEFAULT -update
write -f ddc -o DDC/${TOP_ENTITY}_${NAME}_elab.ddc

#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------
foreach MAXDELAY {10} {

  puts ""
  puts "---------------------------------------------------------"
  puts "|              Working on serializer                    |"
  puts "|               Max. Delay is ~$MAXDELAY~               |"
  puts "---------------------------------------------------------"
  puts ""

  remove_design -design
  read_ddc DDC/${TOP_ENTITY}_${NAME}_elab.ddc

  create_clock clk_i -period ${MAXDELAY}
  set_max_delay ${MAXDELAY} -from [all_inputs] -to [all_outputs]

  # All inputs are the pads
  set_driving_cell  -no_design_rule -library ${LIB} -lib_cell ${DRIV_CELL} -pin ${DRIV_PIN} [remove_from_collection [all_inputs] clk_i]

  # all Outputs have the equivalent load of an output pad
  set_load [load_of ${LIB}/${LOAD_CELL}/${LOAD_PIN}] [all_outputs]

  #moves the register to retime the design
  set_optimize_registers true -designs [get_designs div_two_wrapped]

  compile_ultra -gate_clock


  write -f ddc -h -o DDC/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.ddc

  # get some useful reports
  set REPNAME ${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.rep
  report_timing       >> reports/rep_files/$REPNAME
  report_area         >> reports/rep_files/$REPNAME
  check_design        >> reports/rep_files/$REPNAME
  report_design       >> reports/rep_files/$REPNAME
  
  # write verilog netlist
  change_names -rule verilog -hierarchy
  write -format verilog -output ./netlists/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.v -hierarchy
  }









####################################################
#---------------------------------------------------
# radix 4 divider with different timing constraints
#---------------------------------------------------
####################################################

########################
# switch to worst case libs
########################

set link_library   [list "*" uk65lscllmvbbl_108c125_wc.db \
                             u065gioll25mvir_25_wc.db]

set target_library [list uk65lscllmvbbl_108c125_wc.db \
                         u065gioll25mvir_25_wc.db]

set symbol_library [list uk65lscllmvbbl.sdb \
                         u065gioll25mvir.sdb]

#****** libraries for DesignWare components synthesis ******
set synthetic_library [concat  $synthetic_library dw_foundation.sldb]
set link_library      [concat  $link_library      dw_foundation.sldb]

########################
# set up some vars
########################
remove_design -all
exec rm -rf WORK/*

# Use all the CPU cores
set_host_options -max_cores 8

# use worst case library
# for driving and load
set LIB uk65lscllmvbbl_108c125_wc
set DRIV_CELL BUFM4W
set DRIV_PIN  Z
set LOAD_CELL BUFM4W
set LOAD_PIN  A

# ------------------------------------------------------------------------------
# Analyze Design
# ------------------------------------------------------------------------------
analyze -library WORK -format sverilog {/home/sem18f21/sa/integer-divider/rtl/div_pkg.sv \
  /home/sem18f21/sa/integer-divider/rtl/find_first_one.sv \
  /home/sem18f21/sa/integer-divider/rtl/make_pos.sv \
  /home/sem18f21/sa/integer-divider/rtl/sel4test.sv \
  /home/sem18f21/sa/integer-divider/rtl/radix4_div.sv \
  /home/sem18f21/sa/integer-divider/rtl/radix4_wrapped.sv}

set TOP_ENTITY {div_four_wrapped}

# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
puts "> elaborate div_four_wrapped"
elaborate $TOP_ENTITY -architecture verilog -library DEFAULT -update
write -f ddc -o DDC/${TOP_ENTITY}_${NAME}_elab.ddc

#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------


#foreach MAXDELAY {2.5} { 


foreach MAXDELAY {2.5 2.4 2.3 2.2 2.1 2.0 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1 1.0} {


  puts ""
  puts "---------------------------------------------------------"
  puts "|              Working on Radix 4 divider                   |"
  puts "|               Max. Delay is ~$MAXDELAY~                       |"
  puts "---------------------------------------------------------"
  puts ""

  remove_design -design
  read_ddc DDC/${TOP_ENTITY}_${NAME}_elab.ddc

  create_clock clk_i -period ${MAXDELAY}
  set_max_delay ${MAXDELAY} -from [all_inputs] -to [all_outputs]

  # All inputs are the pads
  set_driving_cell  -no_design_rule -library ${LIB} -lib_cell ${DRIV_CELL} -pin ${DRIV_PIN} [remove_from_collection [all_inputs] clk_i]

  # all Outputs have the equivalent load of an output pad
  set_load [load_of ${LIB}/${LOAD_CELL}/${LOAD_PIN}] [all_outputs]

  #moves the register to retime the design
  set_optimize_registers true -designs [get_designs div_four_wrapped]

  compile_ultra -gate_clock


  write -f ddc -h -o DDC/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.ddc

  # get some useful reports
  set REPNAME ${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.rep
  report_timing       >> reports/rep_files/$REPNAME
  report_area         >> reports/rep_files/$REPNAME
  check_design        >> reports/rep_files/$REPNAME
  report_design       >> reports/rep_files/$REPNAME
  

  # write verilog netlist
  change_names -rule verilog -hierarchy
  write -format verilog -output ./netlists/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.v -hierarchy

}



####################################################
#---------------------------------------------------
# old divider with different timing constraints
#---------------------------------------------------
####################################################

########################
# switch to worst case libs
########################

set link_library   [list "*" uk65lscllmvbbl_108c125_wc.db \
                             u065gioll25mvir_25_wc.db]

set target_library [list uk65lscllmvbbl_108c125_wc.db \
                         u065gioll25mvir_25_wc.db]

set symbol_library [list uk65lscllmvbbl.sdb \
                         u065gioll25mvir.sdb]

#****** libraries for DesignWare components synthesis ******
set synthetic_library [concat  $synthetic_library dw_foundation.sldb]
set link_library      [concat  $link_library      dw_foundation.sldb]

########################
# set up some vars
########################
remove_design -all
exec rm -rf WORK/*

# Use all the CPU cores
set_host_options -max_cores 8

# use worst case library
# for driving and load
set LIB uk65lscllmvbbl_108c125_wc
set DRIV_CELL BUFM4W
set DRIV_PIN  Z
set LOAD_CELL BUFM4W
set LOAD_PIN  A

# ------------------------------------------------------------------------------
# Analyze Design
# ------------------------------------------------------------------------------
analyze -library WORK -format sverilog {/home/sem18f21/sa/integer-divider/rtl/div_pkg.sv \
  /home/sem18f21/sa/integer-divider/rtl/div_old.sv}

set TOP_ENTITY {mult}

# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
puts "> elaborate div_old"
elaborate mult -architecture verilog -library DEFAULT -update
write -f ddc -o DDC/${TOP_ENTITY}_${NAME}_elab.ddc


#-------------------------------------------------------------------------------
#for different clocks
#-------------------------------------------------------------------------------


#foreach MAXDELAY {2.5} {  

foreach MAXDELAY {2.5 2.4 2.3 2.2 2.1 2.0 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1 1.0} {


  puts ""
  puts "---------------------------------------------------------"
  puts "|              Working on the old divider                  |"
  puts "|               Max. Delay is ~$MAXDELAY~                       |"
  puts "---------------------------------------------------------"
  puts ""

  remove_design -design
  read_ddc DDC/${TOP_ENTITY}_${NAME}_elab.ddc

  create_clock clk_i -period ${MAXDELAY}
  set_max_delay ${MAXDELAY} -from [all_inputs] -to [all_outputs]

  # All inputs are the pads
  set_driving_cell  -no_design_rule -library ${LIB} -lib_cell ${DRIV_CELL} -pin ${DRIV_PIN} [remove_from_collection [all_inputs] clk_i]

  # all Outputs have the equivalent load of an output pad
  set_load [load_of ${LIB}/${LOAD_CELL}/${LOAD_PIN}] [all_outputs]

  set_optimize_registers true -designs [get_designs mult]

  compile_ultra -gate_clock 


  write -f ddc -h -o DDC/${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.ddc

  # get some useful reports
  set REPNAME ${TOP_ENTITY}_${NAME}_${MAXDELAY}ns.rep
  report_timing       >> reports/rep_files/$REPNAME
  report_area         >> reports/rep_files/$REPNAME
  check_design        >> reports/rep_files/$REPNAME
  report_design       >> reports/rep_files/$REPNAME
  
}


