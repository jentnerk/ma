#! /bin/tcsh -f

# example file to compile GATE-LEVEL sourcecode


set VER=10.6b
set LIB=gate
set LIB2=sc9_soi
set LIB3=io_ggpr


if (-e ${LIB}) then
  rm -rf ${LIB}
endif

if (-e ${LIB2}) then
  rm -rf ${LIB2}
endif

if (-e ${LIB3}) then
  rm -rf ${LIB3}
endif

vlib-${VER} ${LIB}
vlib-10.6b sc9_soi
vlib-10.6b io_ggpr

# gate-level netlist
vlog-${VER} -work ${LIB} /home/msc18h28/ma/synopsys/netlists/Serializer.v


#compile the design libraries
# vlog-10.6b -work ${LIB2} \
# /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/io_gppr_t18_mv10_mv18_avt_pl/r0p0/verilog//io_gppr_soi12s0_t18_mv10_mv18_avt_pl_udp.v
# vlog-10.6b -work ${LIB2} \
# /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/io_gppr_t18_mv10_mv18_avt_pl/r0p0/verilog//io_gppr_soi12s0_t18_mv10_mv18_avt_pl.v 

# vlog-10.6b -work ${LIB3} \
# /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_svt/r0p0/verilog//sc9_soi12s0_base_svt_neg.v 
# vlog-10.6b -work ${LIB3} \
# /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_svt/r0p0/verilog//sc9_soi12s0_base_svt_udp.v
# vlog-10.6b -work ${LIB3} \
# /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_svt/r0p0/verilog//sc9_soi12s0_base_svt.v 

# testbench
vlog -work ${LIB} /home/msc18h28/ma/sourcecode/serializer_tb.sv

# run with the sim_postlayout.csh script
