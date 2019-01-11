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

	#test only the shift serializer
		vlog -work work /home/msc18h28/ma/sourcecode/shift_serializer/shift_serializer_from_to.sv
		vlog -work work /home/msc18h28/ma/sourcecode/shift_serializer/shift_serializer_from_to_tb.sv
		vlog -work work /home/msc18h28/ma/sourcecode/mixed_serializer/parameters.vh


# compile the testbench
	#vlog -work work /home/msc18h28/ma/sourcecode/shift_serializer_from_to_tb.sv

