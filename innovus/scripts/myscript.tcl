##########################################################################
#  Design Setings
##########################################################################
set TIME [clock seconds]
set TIMESTAMP [clock format $TIME -format _%a_%d_%m_%Y_]

set CHIP        "serializer_chip"

set DESIGNNAME  ${CHIP}

set reportDir  reports
set savePrefix ${DESIGNNAME}


##########################################################################
#  General Setings
##########################################################################
setMultiCpuUsage -localCpu max


##########################################################################
# CTS: Clock Tree Insertion
##########################################################################

## first source the specs
## question, what does this do??
## adapt clockname if wolfgang changes it again
source src/chip.ccopt.spec

## perform clock tree insertion and data path optimization
ccopt_design -outDir reports/timing

## generate clock tree results
mkdir -p reports/clock
report_ccopt_clock_trees -filename reports/clock/clock_trees.rpt
report_ccopt_skew_groups  -filename reports/clock/skew_groups.rpt

ccopt_design -cts
#ccopt_design -outDir ${reportDir}/time -prefix  divider_chip_postCTS-ccopt

## in case there is no report yet, it will be created here
if {![file exists ${reportDir}/clock/]} {
  file mkdir ${reportDir}/clock
}
report_ccopt_clock_trees -filename ${reportDir}/clock/clock_trees.rpt
report_ccopt_skew_groups -filename ${reportDir}/clock/skew_groups.rpt


## setup
timeDesign -postCTS -outDir ${reportDir}/time -prefix  ${CHIP}_postCTS
optDesign  -postCTS -drv -outDir ${reportDir}/time -prefix  ${CHIP}_postCTS-drv
optDesign  -postCTS -outDir ${reportDir}/time -prefix  ${CHIP}_postCTS-opt

## hold
timedesign -postCTS -hold -outDir ${reportDir}/time -prefix ${CHIP}_postCTS
optDesign  -postCTS -hold -outDir ${reportDir}/time -prefix ${CHIP}_postCTS-opt

saveDesign save/${savePrefix}_postCTS.enc


##########################################################################
# route
##########################################################################
setNanoRouteMode -quiet -routeInsertAntennaDiode 1
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign

## checkRoute will also report the nets conectet to a not physical port.
checkRoute
## 
checkPlace


##########################################################################
# time Opt
##########################################################################
## RC will be extracted using the Integrated QRC (IQRC) engine.
setExtractRCMode -engine postRoute -effortLevel high

#setAnalysisMode -analysisType onChipVariation -cppr both

#setDelayCalMode -siAware false
# set in enc.tcl

## setup
timedesign -postRoute -expandedViews -outDir ${reportDir}/time -prefix ${CHIP}_postRoute
optDesign -postRoute -outDir ${reportDir}/time -prefix ${CHIP}_postRoute-opt
optDesign -postRoute -incr  -outDir ${reportDir}/time -prefix ${CHIP}_postRoute-optinc

## hold
#timedesign -postroute -hold -outDir ${reportDir}/time -prefix ${CHIP}_postRoute
#optDesign -postroute -hold -outDir ${reportDir}/time -prefix ${CHIP}_postRoute-opt

##post-route clocktree
report_ccopt_clock_trees -filename reports/clock/clock_treesPostRoute.rpt
report_ccopt_skew_groups  -filename reports/clock/skew_groupsPostRoute.rpt

##mutli-cut vias: cut redundant vias in case manufacturing fails for some
setNanoRouteMode -droutePostRouteSwapVia mutliCut
routeDesign -viaOpt

saveDesign save/${savePrefix}_postRoute.enc



##########################################################################
# chip finishing (do we need that? -> yes)
##########################################################################

source scripts/fillcore-insert.tcl

## check design 
source scripts/checkdesign.tcl

source scripts/exportall.tcl
saveDesign save/${savePrefix}_last.enc

set FINTIME [clock add [clock seconds] -$TIME seconds]
set FINTIMEFMT [clock format $FINTIME -format "%Hh %Mm %Ss" -gmt 1]

puts "$FINTIME"


puts ""
puts "---------------------------------------------------------"
puts "|        FINISHED SCRIPT after $FINTIMEFMT              |"
puts "---------------------------------------------------------"
puts ""
