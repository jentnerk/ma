#modelsim script

#! /bin/tcsh -f

# Example script for compiling RTL sourcecode

set VER=10.6b
set LIB=rtl


if (-e $LIB) then
  rm -rf $LIB 
endif

vlib-${VER} $LIB

# compile the RTL and testbench


vlog -work work /home/msc18h28/ma/sourcecode/shift_serializer/shift_serializer.sv
vlog -work work /home/msc18h28/ma/sourcecode/shift_serializer/shift_serializer_tb.sv
vlog -work work /home/msc18h28/ma/sourcecode/mixed_serializer/parameters.vh

