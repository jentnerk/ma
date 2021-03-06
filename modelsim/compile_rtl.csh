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
	vlog -work work /home/msc18h28/ma/sourcecode/toplevel.sv

	vlog -work work /home/msc18h28/ma/sourcecode/serializer.sv

	vlog -work work /home/msc18h28/ma/sourcecode/Clock_divider.v

# compile the testbench
	vlog -work work /home/msc18h28/ma/sourcecode/serializer_tb.sv
