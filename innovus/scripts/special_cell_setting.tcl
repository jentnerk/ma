###########################################################################
#  Title      : Setings for special cell
#  Project    : gf 45 dz flow
##########################################################################
#  File       : special_cell_setting.tcl
#  Author     : Beat Muheim  <muheim@ee.ethz.ch>
#  Company    : Microelectronics Design Center (DZ), ETH Zurich
##########################################################################
#  Description : Creates the setting for the well tap, tie cells 
#                and filler cells. It does not insert them, this has to be done
#                in the run script.
#  Inputs      :
#  Outputs     : ($wellTap)
#  Rhesuses    : 
##########################################################################
#  Copyright (c) 2018 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.2 - <muheim@ee.ethz.ch> - Wed May  9 14:36:48 CEST 2018
#  - remuve the seting '-avoidAbutment true' for the well_tap mode
# v0.1 - <muheim@ee.ethz.ch> - Wed Feb  7 17:13:53 CET 2018
#  - copy from gf22 v0.3
#    and adapt it
##########################################################################

# To get names of well tap cells (specified as 'CLASS CORE WELLTAP ' in LEF)
set wellTapList(name)   [dbGet [dbGet -p head.libCells.subClass coreWellTap].name]
set wellTap(maxdis) 30

# To strip out one of the list 
foreach type [list "*_A9TS" "*_A9TH" "*_A9TU"] {
  if {0 <= [lsearch $wellTapList(name) $type]} {set wellTap(name)  [lsearch -inline $wellTapList(name) $type]}
}


# To get names of tie high / tie low cells (specified as 'CLASS CORE TIEHIGH' or 'CLASS CORE TIELOW' in LEF), use
set tieCellList(high) [dbGet [dbGet -p head.libCells.subClass coreTieHigh].name]
set tieCellList(low)  [dbGet [dbGet -p head.libCells.subClass coreTieLow].name]

# To strip out one each of the tow list
foreach hl [list high low] {
  foreach type [list "*_A9TS" "*_A9TH" "*_A9TU"] {
    if {0 <= [lsearch $tieCellList($hl) $type]} {set tieCell($hl) [lsearch -inline $tieCellList($hl) $type]}
  }
}

set tieCell(high:low) [list $tieCell(high) $tieCell(low)]


# To get names of the filler cellss (specified as 'CORE SPACER' in LEF)
set fillerCellList(decoup:empty) [dbGet [dbGet -p head.libCells.subClass coreSpacer].name]


## To get names of the filler cellss withe regex
#set fillerCellList(empty) {}
#set fillerCellList(decoup) {}
#foreach cell [dbGet -p head.libCells.name *] {
#  if [string match "SFILL[123456789]*" [dbGet ${cell}.name]]  { lappend fillerCellList(empty)  [dbGet ${cell}.name]}
#  if [string match "FILLCAP[123456789]*" [dbGet ${cell}.name]]  { lappend fillerCellList(decoup) [dbGet ${cell}.name]}
#  if [string match "FILLDGCAP[123456789]*" [dbGet ${cell}.name]]  { lappend fillerCellList(decoup) [dbGet ${cell}.name]}
#}

#set fillerCellList(decoup:empty) [list $fillerCellList(decoup) $fillerCellList(empty)]


#-------------------------------------------------------------------------------
# make the setings


set_well_tap_mode -reset
set_well_tap_mode -cell $wellTap(name) -rule $wellTap(maxdis)

if [llength $tieCell(high:low) ] {
  # set tiehilo mode and insert the new cells
  setTieHiLoMode -reset
  setTieHiLoMode -maxFanout 12 -maxDistance 250 -createHierPort true \
                 -cell $tieCell(high:low)
  # -createHierPort true - try
} else {
  puts "ERROR: find no Tie Cell!"
}

setFillerMode -reset
setFillerMode -core $fillerCellList(decoup:empty)  -distribute_implant_evenly true -ecoMode true
# -viaEnclosure true ??
