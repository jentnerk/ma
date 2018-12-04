###########################################################################
#  Title      : Export all relevant design data.
#  Project    : gf 45 dz flow
##########################################################################
#  File       : exportall.tcl
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
##########################################################################
#  Description : 
#  Inputs      : $DESIGNNAME
#  Outputs     : sdc, netlist, gds
#  Rhesuses    : 
##########################################################################
#  Copyright (c) 2018 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.2 - <muheim@ee.ethz.ch> - Tue Jun  5 13:08:37 CEST 2018
#  - using the arm to gds map file
# v0.1 - <muheim@ee.ethz.ch> - Thu Feb  8 09:38:45 CET 2018
#  - copy from gf22
##########################################################################


# is the design name specified ???
if { [ info exists DESIGNNAME ] } {
   set NAME "$DESIGNNAME"

} else {
    set NAME "final"

}

# RC will be extracted, if not ready don, using the
# Integrated QRC (IQRC) engine.
setExtractRCMode -effortLevel high


# global variable for written the sdf checks checks correctly with a tripl
set_global timing_recompute_sdf_in_setuphold_mode true
# Write out SDF, take the first analysis_views from the hold and the setup list
write_sdf -precision 4 -min_period_edges posedge -recompute_parallel_arcs -remashold -nonegchecks \
          -min_view [lindex [all_hold_analysis_views]  0] \
          -typ_view [lindex [all_setup_analysis_views] 0] \
          -max_view [lindex [all_setup_analysis_views] 0] \
          out/${NAME}.sdf.gz

# This netlist do not contains the filler cells, physical cells.
# This can be used for simulation (normal/with power connections) 
saveNetlist out/${NAME}.v -excludeLeafCell
#saveNetlist out/${NAME}_pwr.v -excludeLeafCell -excludeCellInst {PAD60GU PAD60NU} -includePowerGround

# This netlist contains all filler cells and everything.
# This have to be used for LVS 
saveNetlist out/${NAME}_lvs.v -excludeLeafCell -includePhysicalInst -phys

# layout
setStreamOutMode -SEvianames true -specifyViaName %t_%v -virtualConnection false

# you can set an alternative top name with -structureName 
#streamOut out/${NAME}.gds.gz  -mapFile ../technology/tech.map -outputMacros 
# for design with a macro maged by cockpit
streamOut out/${NAME}.gds.gz -units 1000 -mapFile ../technology/tech.map -outputMacros -merge {  \
  /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_hvt/r0p0/gds2/sc9_soi12s0_base_hvt.gds2 \
  /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_svt/r0p0/gds2/sc9_soi12s0_base_svt.gds2 \
  /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_uvt/r0p0/gds2/sc9_soi12s0_base_uvt.gds2 \
  /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/io_gppr_t18_mv10_mv18_avt_pl/r0p0/gds2/io_gppr_45rfsoi_t18_mv10_mv18_avt_pl_8LM_3Mx_1Cx_1Ux_2Ox_LD.gds2 \
 }

