#! /bin/tcsh -f

# Example script for compiling RTL sourcecode

set VER=10.6b
set LIB=rtl


if (-e $LIB) then
  rm -rf $LIB 
endif

vlib-${VER} $LIB

# compile sourcecode
vcom-${VER}  -v -work ${LIB} -check_synthesis ../RTL/Toplevel_serializer.v
vcom-${VER}  -v -work ${LIB} -check_synthesis ../RTL/Serializer.v

# testbench (note no -check_synthesis)
vcom-${VER}  -sv -work ${LIB} ../rtl/serializer_tb.sv


# use a command like 
#
   vsim-${VER} -lib rtl serializer_tb
#
# to simulate


