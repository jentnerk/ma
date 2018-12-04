# Initialize synopsis and elaborate design
source scripts/synth_top/elaborate_top.tcl



#set all the constraints for slow
source scripts/synth_top/constraints.tcl

# compile the design
compile_ultra -scan -gate_clock

#set dont_touch and apply harder constraints
#set_dont_touch [get_designs div_simple_20]
#source scripts/synth_top/constraints_hard.tcl

#compile_ultra -incremental -scan -gate_clock
#remove_attribute [get_designs div_simple_20]

# insert scan chains
source scripts/synth_top/dft.tcl

#write netlist and reports
source scripts/synth_top/write_net.tcl
