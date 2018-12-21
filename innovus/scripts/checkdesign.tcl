##########################################################################
#  Title       : final check of the design
#  Project     : gf 45 dz flow
##########################################################################
#  File        : checkdesign.tcl
#  Author      : Beat Muheim  <muheim@ee.ethz.ch>
#  Company     : Microelectronics Design Center (DZ), ETH Zurich
##########################################################################
#  Description : will do the final check of the design and 
#                some reports.
#  Inputs      : ($DESIGNNAME)
#                ($wellTap) 
#  Outputs     : reports
#  Rhesuses    : 
##########################################################################
#  Copyright (c) 2018 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.2 - <muheim@ee.ethz.ch> - Fri Feb  9 11:32:29 CET 2018
#  - replase verifyGeometry by verify_drc
# v0.1 - <muheim@ee.ethz.ch> - Wed Jan 24 10:58:04 CET 2018
#  - copy from tsmc28 v0.1 
##########################################################################

# is the design name specified ???
if { [ info exists DESIGNNAME ] } {
   set NAME "$DESIGNNAME"

} else {
    set NAME "final"

}

# create the verify under reports when not existing
if {![file exists reports/verify]} {
  file mkdir reports/verify
}

# when the wellTapList is not set we create it
if {![info exists wellTap(name)]} {
  foreach cell [dbGet -p head.libCells.name *] {
    if [string match "TAPCELL*" [dbGet ${cell}.name]] { set wellTap(name) [dbGet ${cell}.name]}
  }
  set wellTap(maxdis) 30
}

## verify
puts "porform Connectivity, Geometry, ProcessAntenna and WellTap Checks"
verifyConnectivity -type all -geomConnect -report reports/verify/${NAME}.connect.rpt
#verifyGeometry -antenna -report reports/verify/${NAME}_geom.rpt
verify_drc -report reports/verify/${NAME}.drc.rpt
verifyProcessAntenna -leffile reports/verify/${NAME}_antenna.lef -reportfile reports/verify/${NAME}_antenna.rpt 
verifyWellTap -cell $wellTap(name) -rule $wellTap(maxdis) -report  reports/verify/${NAME}_wellTap.rpt 


## reports
puts ""
puts "Writing summary report"
summaryReport -noHtml -outfile reports/verify/summaryReport.rpt

puts ""
puts "Checking nets that exceed the default delay limit"
puts "There should be no nets in the report below"
report_net -min_fanout [lindex $rdaUseDefaultDelayLimit 0]

