#
# VPG
#
# Marco Eppenberger <marco.eppenberger@ief.ee.ethz.ch>
#
# (c) IEF, ETH Zurich, 2018
#
#
# Backend Script for the PRBS Generator macro cell.
# Partially copied from the brilliant work of  Fabian Schuiki.
#

source [file dirname [info script]]/eos34_lib.tcl

# ------------------------------------------------------------------------------
# Design Initialization
# ------------------------------------------------------------------------------

# top-level cell name
set DESIGN Experiment4_chip

set OUTNAME ${DESIGN}_[exec date +%Y%m%d_%H%M]
set REPDIR reports/$OUTNAME
set SAVEDIR save/$OUTNAME
set OUTDIR out/$OUTNAME

exec mkdir -p $REPDIR
exec mkdir -p $SAVEDIR

# do init stuff
eos34_common_init

# initialization variables
set init_verilog [list $SYNDIR/netlists/Experiment4_synth.v $BEDIR/src/Experiment4_chip.v]
set eos34_sdc_logic_files [list $BEDIR/src/Experiment4_constraints_logic.sdc]
set eos34_sdc_logic_and_io_files [list $BEDIR/src/Experiment4_constraints_logic.sdc $BEDIR/src/Experiment4_constraints_padio.sdc]
set init_mmmc_file $BEDIR/src/eos34_macro.mmmcview.tcl

## init design
settings_pre_init
init_design
settings_post_init

# double check clocks
report_clocks -view aview_func_tt_1V0_25C > $REPDIR/00.sdc_defined_clocks_tt.rpt
check_timing -verbose -view aview_func_tt_1V0_25C > $REPDIR/00.sdc_check_timing.rpt

# ------------------------------------------------------------------------------
# Floorplaning
# ------------------------------------------------------------------------------

setDrawView fplan

# design variables
set DIGITAL_WIDTH 330.0
set DIGITAL_HEIGHT 2200.0
set OFFSET_PRING 11.0
set PADS_HEIGHT 130.0

# set coordinates for the design
set IO_LL_X     0
set IO_LL_Y     0
set IO_UR_X     $DIGITAL_WIDTH
set IO_UR_Y     [expr $DIGITAL_HEIGHT + $PADS_HEIGHT]

# specify floor plan
#floorPlan -coreMarginsBy die -d [expr $IO_UR_X] [expr $IO_UR_Y] $OFFSET_PRING [expr $OFFSET_PRING + $PADS_HEIGHT] $OFFSET_PRING $OFFSET_PRING -noSnapToGrid
floorPlan -b $IO_LL_X $IO_LL_Y $IO_UR_X $IO_UR_Y $IO_LL_X $IO_LL_Y $IO_UR_X $IO_UR_Y $OFFSET_PRING [expr $PADS_HEIGHT + $OFFSET_PRING] [expr $DIGITAL_WIDTH-$OFFSET_PRING] [expr $PADS_HEIGHT + $DIGITAL_HEIGHT - $OFFSET_PRING] -noSnapToGrid
fit

# add IO row at bottom (probably not needed...)
createIoRow -site IOSITE_io_gppr_45rfsoi_t18_mv10_mv18_avt_pl_130_0000 -side S -beginOffset 0 -rowMargin 0 -endOffset 0

# load pad and pin locations
loadIoFile $BEDIR/src/Experiment4.io -noAdjustDieSize

# place internal pins (since we dont use bumps, stupid AREAIO cells)
setPinAssignMode -pinEditInBatch true
editPin -side inside -layer ld -assign {12.5 84.8} -pinWidth 3 -pinDepth 10 -pin EnableAll_TI -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {87.5.5 84.8} -pinWidth 3 -pinDepth 10 -pin ClkExt_CI -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {167.5 84.8} -pinWidth 3 -pinDepth 10 -pin DReset_RI -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {192.5 84.8} -pinWidth 3 -pinDepth 10 -pin {ClkSel_SI[0]} -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {217.5 84.8} -pinWidth 3 -pinDepth 10 -pin {ClkSel_SI[1]} -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {242.5 84.8} -pinWidth 3 -pinDepth 10 -pin OffChip_SCLK -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {267.5 84.8} -pinWidth 3 -pinDepth 10 -pin OffChip_MOSI -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {292.5 84.8} -pinWidth 3 -pinDepth 10 -pin OffChip_MISO -snap USERGRID -fixedPin
editPin -side inside -layer ld -assign {317.5 84.8} -pinWidth 3 -pinDepth 10 -pin OffChip_MVLD -snap USERGRID -fixedPin
setPinAssignMode -pinEditInBatch false

# floor plan
# selectObject Module top
# ungroup top
# deselectAll
# setObjFPlanBox Module top/exp4a 100.680 124.198 329.820 1363.200
# setObjFPlanBox Module top/exp4b 100.773 1301.460 329.820 2479.560
# setObjFPlanBox Module top/exp4d 0.170 124.620 224.873 1416.120
# setObjFPlanBox Module top/exp4e 0.170 1242.240 231.404 2479.560
selectObject Module top
setObjFPlanBox Module top 0.170 -28.544 329.820 2329.620
deselectAll

setDrawView place

# insert pad row fillers (not needed, we juuuuust fit the whole 405um width)
#addIoRowFiller -cell {PFILL10_18_PL_V PFILL5_18_PL_V PFILL2_18_PL_V PFILL1NC_18_PL_V} -prefix fillperi
#addIoRowFiller -cell { PFILL1NC_18_PL_V } -prefix fillperi -fillAnyGap


# ------------------------------------------------------------------------------
# Placement and Power Routing
# ------------------------------------------------------------------------------

# Configure power intent.
free_power_intent
read_power_intent -cpf $BEDIR/src/eos34_pads.cpf
commit_power_intent

# update delay corners
update_delay_corners_with_PD PD_core
update_delay_corners_with_PD PD_io

# Add endcaps and welltaps (could also do after power grid!)
source $BEDIR/scripts/special_cell_setting.tcl

# BITIEs are optional for 45RFSOI process, but you need to leave out the DGCAP filler cells too if you dont use them
addWellTap -prefix WELLTAP -cellInterval $wellTap(maxdis) -inRowOffset 10 -checkerBoard

# manual routing options
setNanoRouteMode -reset
setNanoRouteMode -routeBottomRoutingLayer 1
setNanoRouteMode -routeTopRoutingLayer 7

# options found in ARM tech library (encounter_route_options.tcl)
#setNanoRouteMode -routeWithViaInPin                  false
setNanoRouteMode -routeWithViaOnlyForStandardCellPin false
setNanoRouteMode -dbViaWeight {* 1 *double* 4}
setNanoRouteMode -drouteUseConservativeCutSpacingForPin true

# exclude pad nets from routing
setAttribute -net SNS_net -skip_routing true
setAttribute -net RTO_net -skip_routing true
setAttribute -net TRIGGER_net -skip_routing true

# Add power grid.
source $BEDIR/src/Experiment4and5_power_routes.tcl

# !!!! FIX REMAINING DRCs MANUALLY NOW !!!!

# save
saveDesign $SAVEDIR/power_grid_and_pins.enc -libs

# Delete the existing tie cells in the design.
deleteTieHiLo -cell $tieCellList(high)
deleteTieHiLo -cell $tieCellList(low)

# ------------------------------------------------------------------------------
# PreCTS Flow
# ------------------------------------------------------------------------------

# prevent using large vias to connect to std cell pins 
setNanoRouteMode -routeWithViaInPin "1:1"
# try not to route with layer 7 or 6, maybe this is easier for antennas and stuff
setNanoRouteMode -routeTopRoutingLayer 5

# Validate timing constraints.
timeDesign -prePlace -outDir $REPDIR/00.timing.preplace
check_timing -verbose > $REPDIR/01.timing_check.preplace.rpt
report_path_exceptions -view aview_func_tt_1V0_25C > $REPDIR/01.timing_path_exceptions.rpt
report_ports -view aview_func_tt_1V0_25C > $REPDIR/01.ports.rpt

# Check the design in general.
checkDesign -all -outdir $REPDIR/02.check_design > $REPDIR/02.check_design.rpt

redraw

# Run preplace optimization and placement.
setPlaceMode -reset
setPlaceMode -place_global_cong_effort high \
             -place_global_timing_effort high
placeDesign

redraw

optDesign -preCTS -drv -outDir $REPDIR/04.timing.preCTS.optdrv
optDesign -preCTS -outDir $REPDIR/05.timing.preCTS.opt
timeDesign -preCTS -outDir $REPDIR/06.timing.preCTS.final -expandedViews

# place tie cells
addTieHiLo -prefix TIE

# save design
saveDesign $SAVEDIR/preCTS.enc -libs


# ------------------------------------------------------------------------------
# PostCTS Flow
# ------------------------------------------------------------------------------

source $BEDIR/src/Experiment4and5_ccopt_spec.tcl

create_ccopt_clock_tree_spec
ccopt_design

# Validate and optimize setup times.
#optDesign -postCTS -outDir $REPDIR/07.timing.postCTS.setup_opt
timeDesign -postCTS -outDir $REPDIR/08.timing.postCTS.setup -expandedViews

# Validate and optimize hold times.
optDesign -postCTS -hold -outDir $REPDIR/09.timing.postCTS.hold_opt -expandedViews
timeDesign -postCTS -hold -outDir $REPDIR/10.timing.postCTS.hold -expandedViews

# Report clock trees.
report_ccopt_clock_trees -filename $REPDIR/11.CTS.clock_trees.rpt
report_ccopt_skew_groups -filename $REPDIR/12.CTS.skew_groups.rpt

# save
saveDesign $SAVEDIR/postCTS.enc -libs

# ------------------------------------------------------------------------------
# Route Flow
# ------------------------------------------------------------------------------

# add filler cells before routing 
addFiller

# Route the design.
routeDesign

# repeat the following as needed to fix all DRC violations
clearDrc
verify_drc
ecoRoute -fix_drc

saveDesign $SAVEDIR/routed_drc.enc -libs

# optimize Vias (not needed, as routeDesign does this)
# setNanoRouteMode -drouteUseMultiCutViaEffort high
# setNanoRouteMode -droutePostRouteMinimizeViaCount false
# setNanoRouteMode -droutePostRouteSwapVia multiCut
# routeDesign -viaOpt

# Fix remaining setup and hold violations.
optDesign -postRoute -drv -outDir $REPDIR/13.timing.postroute.opt_drv
optDesign -postRoute -setup -hold -outDir $REPDIR/13.timing.postroute.opt_timing
saveDesign $SAVEDIR/routed_opt.enc -libs

# Validate timings.
# high effort level actually crashes xQRC...
setExtractRCMode -engine postRoute -effortLevel medium
timeDesign -postRoute -outDir $REPDIR/14.timing.postroute.setup -expandedViews
timeDesign -postRoute -hold -outDir $REPDIR/15.timing.postroute.hold -expandedViews

# change extract mode and save
saveDesign $SAVEDIR/routed_timed.enc -libs


# ------------------------------------------------------------------------------
# PostRoute Flow
# ------------------------------------------------------------------------------

# checks
#checkFiller -file $REPDIR/16.verify.filler.postroute.rpt
#checkPlace $REPDIR/17.verify.place.postroute.rpt

# Fix remaining setup and hold violations.
#optDesign -postRoute -setup -outDir $REPDIR/17.timing.postroute.opt
#optDesign -postRoute -setup -hold -outDir $REPDIR/18.timing.postroute.opt
#saveDesign $SAVEDIR/routed_opt.enc -libs

# Fix fillers which tend to be broken here.
#addFiller
#ecoPlace

# Magic chip finishing.
# as needed: ecoRoute -fix_drc

# ------------------------------------------------------------------------------
# Signoff
# ------------------------------------------------------------------------------

# Verify.
clearDrc
verifyConnectivity -type all -geomConnect -report $REPDIR/18.verify.connect.rpt
verify_drc -report $REPDIR/19.verify.drc.rpt
verifyProcessAntenna -reportfile $REPDIR/20.verify.antenna.rpt
verifyWellTap -report $REPDIR/21.verify.welltap.rpt
checkPlace $REPDIR/22.verify.place.rpt
checkFiller -file $REPDIR/23.verify.filler.rpt
checkRoute > $REPDIR/24.verify.route.rpt

# Validate timings a final time.
timeDesign -signoff -reportOnly -outDir $REPDIR/25.timing.signoff.setup
timeDesign -signoff -hold -reportOnly -outDir $REPDIR/26.timing.signoff.hold

## reports from Beat
puts ""
puts "Writing summary report"
summaryReport -noHtml -outfile $REPDIR/27.final_summary_report.rpt

puts ""
puts "Checking nets that exceed the default delay limit"
puts "There should be no nets in the report below"
report_net -min_fanout [lindex $rdaUseDefaultDelayLimit 0]





# stop executing script here
break





# ------------------------------------------------------------------------------
# Stream Out
# ------------------------------------------------------------------------------

exec mkdir -p ${OUTDIR}

# Create a final snapshot of the design.
saveDesign $SAVEDIR/final.enc -libs

# netlist for gate level simulation
saveNetlist $OUTDIR/$OUTNAME.v -excludeLeafCell

# netlist for LVS (we have to exlude the passive filler cells)
saveNetlist $OUTDIR/$OUTNAME.lvs.v -excludeCellInst $passiveFillers -excludeLeafCell -includePhysicalInst -phys

# Extract RC data and store as SPEF files.
#foreach rc_corner [all_rc_corners] {
#    rcOut -spef $OUTDIR/$OUTNAME.$rc_corner.spef -rc_corner $rc_corner
#}

# Generate a LEF file.
#write_lef_abstract -stripePin -PGPinLayers {1 7} $OUTDIR/$OUTNAME.lef

# Generate the ILM.
#createInterfaceLogic -dir $OUTDIR/$OUTNAME.ilm

# Write out IO file
saveIoFile -locations $OUTDIR/$OUTNAME.io

# Generate the GDS layout data.
setStreamOutMode -SEvianames true -specifyViaName %t_%v -virtualConnection false
# you can set an alternative top name with -structureName
# for design with a macro maged by cockpit

# GF provided map file: $TECHDIR/soc2gds.map
# ARM provided map file: $TECHDIR/tech.map
streamOut $OUTDIR/${OUTNAME}.gds.gz -units 1000 \
    -mapFile $TECHDIR/tech.map \
    -outputMacros -merge {  \
      /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_hvt/r0p0/gds2/sc9_soi12s0_base_hvt.gds2 \
      /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_svt/r0p0/gds2/sc9_soi12s0_base_svt.gds2 \
      /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/sc9_base_uvt/r0p0/gds2/sc9_soi12s0_base_uvt.gds2 \
      /usr/pack/gf-45soi-kgf/arm/gf/45rfsoi/io_gppr_t18_mv10_mv18_avt_pl/r0p0/gds2/io_gppr_45rfsoi_t18_mv10_mv18_avt_pl_8LM_3Mx_1Cx_1Ux_2Ox_LD.gds2 \
 }

# Generate the LIB files.
#foreach view [all_setup_analysis_views] {
#    puts "generating LIB view $view"
#    do_extract_model -view $view $OUTDIR/${OUTNAME}_${view}.lib
#}

# Generate an SDF file.
# set_analysis_view -setup aview_func_tt_1V0_25C -hold aview_func_tt_1V0_25C
set_global timing_recompute_sdf_in_setuphold_mode true
setExtractRCMode -engine postRoute -effortLevel signoff
extractRC
write_sdf \
    -precision 4 \
    -interconn all\
    -min_period_edges posedge \
    -recompute_parallel_arcs \
    -nonegchecks \
    -min_view aview_func_tt_1V0_25C \
    -typ_view aview_func_tt_1V0_25C \
    -max_view aview_func_tt_1V0_25C \
    $OUTDIR/$OUTNAME.sdf.gz
