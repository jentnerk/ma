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
	vlog -work work /home/msc18h28/ma/RTL/toplevel.sv

	vlog -work work /home/msc18h28/ma/RTL/serializer.sv

	vlog -work work /home/msc18h28/ma/RTL/Clock_divider.v

# compile the testbench
	vlog -work work /home/msc18h28/ma/RTL/serializer_tb.sv
