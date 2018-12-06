#! /bin/tcsh -f

# Example script for compiling RTL sourcecode

set VER=10.6b
set LIB=work


if (-e $LIB) then
  rm -rf $LIB
endif

vlib-${VER} $LIB

# compile sourcecode

#always has to be activated !
vlog-${VER} -sv -work ${LIB} ../rtl/div_pkg.sv




#vlog-${VER} -sv -work ${LIB} ../rtl/radix2_div.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/radix2_wrapped.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/radix4_div.svfi
#vlog-${VER} -sv -work ${LIB} ../rtl/radix4_wrapped.sv
vlog-${VER} -sv -work ${LIB} ../rtl/div_simple_6_one_cycle.sv



#vlog-${VER} -sv -work ${LIB} ../rtl/sel4test.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/dummy.sv

#vlog-${VER} -sv -work ${LIB} ../rtl/div_old.sv
vlog-${VER} -sv -work ${LIB} ../rtl/make_pos.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/find_first_one.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/behav_sram.sv

#vlog-${VER} -sv -work ${LIB} ../rtl/divider_top.sv

# testbench (note no -check_synthesis)
#vlog-${VER} -sv -work ${LIB} ../rtl/4div_tb.sv
vlog-${VER} -sv -work ${LIB} ../rtl/2div_tb.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/2div_tb.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/div_old_tb.sv
#vlog-${VER} -sv -work ${LIB} ../rtl/divider_top_tb.sv

# use a command like
#
#vsim-${VER} -lib ${LIB} div_tb &
#
# to simulate
