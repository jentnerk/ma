#modelsim script

#! /bin/tcsh -f

# Example script for compiling RTL sourcecode

set VER=10.6b
set LIB=rtl


if (-e $LIB) then
  rm -rf $LIB 
endif

vlib-${VER} $LIB

# compile the RTL
	#test only the tree serializer
		vlog -work work /home/msc18h28/ma/sourcecode/tree_serializer/toplevel_tree_serializer.sv
		vlog -work work /home/msc18h28/ma/sourcecode/tree_serializer/tree_serializer_recursive.sv
		vlog -work work /home/msc18h28/ma/sourcecode/tree_serializer/Clock_divider.sv
		vlog -work work /home/msc18h28/ma/sourcecode/mixed_serializer/parameters.vh


# compile the testbench
	vlog -work work /home/msc18h28/ma/sourcecode/tree_serializer/tree_serializer_tb.sv

