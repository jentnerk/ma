

set NAME {}

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
analyze -library WORK -format sverilog {/home/msc18h28/ma/sourcecode/toplevel.sv /home/msc18h28/ma/sourcecode/serializer.sv /home/msc18h28/ma/sourcecode/Clock_divider.v}
set TOP_ENTITY {toplevel}
set ENTITY {Serializer}

# ------------------------------------------------------------------------------
# Elaborate Design
# ------------------------------------------------------------------------------
elaborate $TOP_ENTITY

# create clocks
create_clock clk -period $CLK_PERIOD
#create_generated_clock -name DClkDiv2_clk -divide_by 2 -source $DCLK_SOURCE_PIN [get_pin clkdiv4/area_div0_reg_div2_reg/Q]

write -f ddc -o DDC/${ENTITY}_${NAME}elab.ddc

read_ddc DDC/${ENTITY}_${NAME}elab.ddc

# drivers 
#set_driving_cell -no_design_rule -lib_cell ${CELL_LIB} -pin ${PAD_LIB} [remove_from_collection [all_inputs] clk]
#gives the error: Error: Cannot find the specified driving cell in memory.   (UID-993)

# loads
#set_load [load_of ${LIB}/${LOAD_CELL}/${LOAD_PIN}] [all_outputs]

compile_ultra -no_autoungroup

# write verilog netlist
change_names -rule verilog -hierarchy
write -format verilog -output ./netlists/${ENTITY}${NAME}.v -hierarchy

# write timing information
write_sdc -nosplit ./netlists/$ENTITY\_synth.sdc
exec grep -v -E "set_clock_|set_ideal_|create_clock" ./netlists/$ENTITY\_synth.sdc > netlists/$ENTITY\_synth.be.sdc
write_sdf ./netlists/$ENTITY\_synth.sdf



