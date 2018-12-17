#!/bin/tcsh -f

set VER=10.6b
set LIB=gate

vsim-$VER -t 1ps -lib $LIB \
          -L ../synopsys/alib/alib-52/sc9_soi12s0_base_svt_ss_nominal_max_0p90v_125c_mxs \
          -L ../synopsys/alib/alib-52/io_gppr_soi12s0_t18_mv10_mv18_avt_pl_tt_cnom_1p00v_1p80v_25c \
          -sdftype toplevel=../synopsys/netlists/serializer_synth.sdf +sdf_verbose \
          -v2k_int_delays +no_glitch_msg\
          serializer_tb

# use:
#
#   vsim-10.6b -help 
#
# to see available options
