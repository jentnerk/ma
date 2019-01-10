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
	vlog -work work /home/msc18h28/ma/sourcecode/mixed_serializer/toplevel.sv
	log -work work /home/msc18h28/ma/sourcecode/mixed_serializer/shift_serializer_from_to.sv

# compile the testbench
	vlog -work work /home/msc18h28/ma/sourcecode/toplevel_tb.sv
