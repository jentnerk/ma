#########################################################################
#  Title       : Sample to setup the MMMC view definition file.
#  Project     : gf 45 dz flow
##########################################################################
#  File        : mmmc.view.tcl
#  Author      : Beat Muheim  <muheim@ee.ethz.ch>
#  Company     : Microelectronics Design Center (DZ), ETH Zurich
##########################################################################
#  Description : 
#    There are 4 files in this fictional MMMC (multi-mode multi-corner)
#    analysis setup:
#      - src/sample/mmmc_shared.sdc        SDC file with common constraints
#      - src/sample/mmmc_functional.sdc    Functional mode constraints
#      - src/sample/mmmc_test.sdc          Test mode constraints
#                                          (also used for hold timing analysis)
#      - src/sample/mmmc.view.tcl          Sample TCL file that can be adapted
#
#    Please note these are just for reference, adapt according to your design!
#
##########################################################################
#  Copyright (c) 2018 Microelectronics Design Center, ETH Zurich
##########################################################################
# v0.1  - bm - Wed Jan 24 11:05:06 CET 2018
#  - copy from tsmc28 v0.2 and adapt 
##########################################################################

#################################################################
## INITIALIZATION
#################################################################

## Three delay calculation corners are defined here typical, best, worst
## the long command parses the 
create_library_set -name typical_libs \
                   -timing [ list \
                              ../technology/lib/sc9_soi12s0_base_hvt_tt_nominal_max_1p00v_25c_mns.lib \
			      ../technology/lib/sc9_soi12s0_base_svt_tt_nominal_max_1p00v_25c_mns.lib \
			      ../technology/lib/sc9_soi12s0_base_uvt_tt_nominal_max_1p00v_25c_mns.lib \
			      ../technology/lib/io_gppr_soi12s0_t18_mv10_mv18_avt_pl_tt_cnom_1p00v_1p80v_25c.lib \
                           ]
create_library_set -name best_libs \
                   -timing [ list \
                              ../technology/lib/sc9_soi12s0_base_hvt_ff_nominal_min_1p10v_m40c_mns.lib \
			      ../technology/lib/sc9_soi12s0_base_svt_ff_nominal_min_1p10v_m40c_mns.lib \
			      ../technology/lib/sc9_soi12s0_base_uvt_ff_nominal_min_1p10v_m40c_mns.lib \
			      ../technology/lib/io_gppr_soi12s0_t18_mv10_mv18_avt_pl_ff_cnom_1p10v_1p95v_m40c.lib \
                           ]
create_library_set -name worst_libs \
                   -timing [ list \
                              ../technology/lib/sc9_soi12s0_base_hvt_ss_nominal_max_0p90v_125c_mns.lib \
			      ../technology/lib/sc9_soi12s0_base_svt_ss_nominal_max_0p90v_125c_mns.lib \
			      ../technology/lib/sc9_soi12s0_base_uvt_ss_nominal_max_0p90v_125c_mns.lib \
			      ../technology/lib/io_gppr_soi12s0_t18_mv10_mv18_avt_pl_ss_cnom_0p90v_1p65v_125c.lib \
                           ]

# RC corners
create_rc_corner -name typical_rc -qx_tech_file ../technology/qrc/nominal/qrcTechFile
create_rc_corner -name best_rc    -qx_tech_file ../technology/qrc/FuncCmin/qrcTechFile
create_rc_corner -name worst_rc   -qx_tech_file ../technology/qrc/FuncCmax/qrcTechFile


## Three delay corners are defined here
create_delay_corner -name typical_delay -library_set typical_libs -rc_corner typical_rc
create_delay_corner -name best_delay    -library_set best_libs    -rc_corner best_rc
create_delay_corner -name worst_delay   -library_set worst_libs   -rc_corner worst_rc

update_delay_corner -name typical_delay -power_domain PD_core
update_delay_corner -name best_delay    -power_domain PD_core
update_delay_corner -name worst_delay   -power_domain PD_core

update_delay_corner -name typical_delay -power_domain PD_pad
update_delay_corner -name best_delay    -power_domain PD_pad
update_delay_corner -name worst_delay   -power_domain PD_pad

#update_delay_corner -name typical_delay -power_domain PD_cluster
#update_delay_corner -name best_delay    -power_domain PD_cluster
#update_delay_corner -name worst_delay   -power_domain PD_cluster

#################################################################
## LOAD CONSTRAINTS
#################################################################

## Here the SDC files that are part of MMMC flow are defined. 
## In this fictional example we have three modes 
##  1) functional: standard mode where the chip is functioning normally,
##                 timing paths from test inputs are disabled
##  2) test      : works with a slower clock, timing paths from test 
##                 inputs are enabled
##  3) hold      : Timing mode to check hold violations covers both cases.
##
## Each of the above mode will have their own constraints defined in a 
## separate SDC file. IN addition, there is a mmmc_shared.sdc that contains
## constraints that are common between two modes. These are just examples, 
## adjust according to your own requirements
##
create_constraint_mode -name func_mode -sdc_files [list src/mmmc_functional.sdc \
                                                        src/mmmc_shared.sdc ]   
create_constraint_mode -name test_mode -sdc_files [list src/mmmc_test.sdc \
                                                        src/mmmc_shared.sdc ]  

## now we create a view that combined the MODE with the CORNER
## hence the name Multi MODE multi CORNER.
##
## This example uses three views:
##
create_analysis_view -name func_view -delay_corner typical_delay -constraint_mode func_mode
create_analysis_view -name test_view -delay_corner typical_delay -constraint_mode test_mode
create_analysis_view -name hold_view -delay_corner best_delay    -constraint_mode test_mode

#################################################################
## SET ANALYSIS VIEWS
#################################################################

## This command determines which VIEWS will be used for analysis. In this
## example we use both 'functional' and 'test_mode' when doing setup analysis
## and we use only the 'hold' view when doing hold analysis. 

set_analysis_view -setup { func_view test_view } \
                  -hold  { hold_view }
                  
## *IMPORTANT* It is actually possible that due to the differences in modelling,
##             for some circuits it could actually be possible that hold violations
##             can occur for 'typical' or 'worst' timing. We would advise to create
##             hold views with three different delay corners, just to make sure that this
##             is not the case. 
                  
                  
## The MMMC will affect the way some of the commands are going to work:
## use:
##   timeDesign -expandedViews
## to get separate reports for each view
                  
