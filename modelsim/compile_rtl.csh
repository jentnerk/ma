#! /bin/tcsh -f

# Example script for compiling RTL sourcecode

set VER=10.6b
set LIB=rtl


if (-e $LIB) then
  rm -rf $LIB 
endif

vlib-${VER} $LIB

# compile sourcecode
vlog-${VER}  -work ${LIB} ../RTL/Toplevel_serializer.v
vlog-${VER}  -work ${LIB} ../RTL/Serializer.v

# testbench 
vlog-${VER}  -sv -work ${LIB} ../RTL/serializer_tb.sv


# use a command like 
#
   vsim-${VER} -lib rtl serializer_tb
#
# to simulate


