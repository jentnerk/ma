# 
# Encounter/Innovus init 
#
# v0.1 - bm  - Thu Jan 28 15:09:59 CET 2016
# - copy from gf28 v0.1 and adapt it


# change report timing format to include also the load
set_global report_timing_format {instance arc cell slew load delay arrival}
#set_global timing_report_timing_header_detail_info extended

# alternatively you can also add fanout to the report
#set_global report_timing_format {instance arc cell slew load fanout delay arrival}

# to allowed after CTS to do the reload the constraint withe 
# "set_analysis_view -update_timing" after "update_constraint_mode ..."
set_global timing_defer_mmmc_object_updates true


# To prevent using the signal integrity for timing calculate.
# It also not asking for using Chip Variation doing the timing calculation after
# routing.
setDelayCalMode -siAware false

# set the temp dir
set env(TMPDIR) "$env(PWD)/../tmp"

# set the technology
setDesignMode -process 45

## # umc65 has 4 grid units per gate
## set dbgSitesPerGate 4

## Specifies the lowest layer the NanoRoute router uses for routing.
setNanoRouteMode -routeBottomRoutingLayer 2

## Needed to support the new 32/28nm syntax for OPPOSITEOL rule
#setNanoRouteMode -drouteExpFixOppoEolChecker true

## Starts a particular EOL fixing in iteration 0 instead of latter iteration.
#setNanoRouteMode -drouteExpAdvancedFixingIteration 0



# suppress message
