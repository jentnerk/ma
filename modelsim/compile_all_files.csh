#! /bin/tcsh -f

# Example script for compiling RTL sourcecode

set VER=10.6b
set LIB=work


if (-e $LIB) then
  rm -rf $LIB
endif

vlib-${VER} $LIB

# compile sourcecode
vlog-${VER} -v -work ${LIB} ../RTL/Toplevel_serializer.v
vlog-${VER} -v -work ${LIB} ../RTL/Serializer.v

# testbench (note no -check_synthesis)
vlog-${VER} -sv -work ${LIB} ../rtl/serializer_tb.sv


# use a command like
#
#vsim-${VER} -lib ${LIB} div_tb &
#
# to simulate
