#!/bin/tcsh -f

set VER=10.6b
set LIB=gate
set LIB2=sc9_soi
set LIB3=io_ggpr




vsim-$VER -t 1ps -lib $LIB \
          #-L $LIB2 \
          #-L $LIB3 \
          -L sc9_soi12s0_base_hvt_vlog -L sc9_soi12s0_base_svt_vlog -L sc9_soi12s0_base_uvt_vlog -L io_gppr_soi12s0_t18_mv10_mv18_avt_pl_vlog \
          #-sdftyp /toplevel=/home/msc18h28/ma/synopsys/netlists/Serializer_synth.sdf +sdf_verbose \
          #-v2k_int_delays +no_glitch_msg \
          #-warning 3009 \
          serializer_tb


# use:
#
#   vsim-10.6b -help 
#
# to see available options
