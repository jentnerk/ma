#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Dec 21 09:34:37 2018                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
#@(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
#@(#)CDS: CPE v17.11-s095
#@(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)

set_global report_timing_format {instance arc cell slew load delay arrival}
set_global timing_defer_mmmc_object_updates true
setDelayCalMode -siAware false
setDesignMode -process 45
setNanoRouteMode -routeBottomRoutingLayer 2
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
setMultiCpuUsage -localCpu max
delete_ccopt_clock_tree_spec
create_route_type -name default_route_type_leaf -bottom_preferred_layer 1 -top_preferred_layer 6
delete_ccopt_clock_tree_spec
create_ccopt_clock_tree -name clk -source Clk_CI
set defHierChar /
set init_verilog {../synopsys/netlists/top.v src/chip.v}
set init_verilog {../synopsys/netlists/Serializer.v src/chip.v}
set init_design_settop 0
set init_lef_file {../technology/lef/45RFSOI_8LM_3Mx_1Cx_1Ux_2Ox_LD_tech.lef ../technology/lef/sc9_soi12s0_base_hvt.lef ../technology/lef/sc9_soi12s0_base_svt.lef ../technology/lef/sc9_soi12s0_base_uvt.lef ../technology/lef/io_gppr_45rfsoi_t18_mv10_mv18_avt_pl_8LM_3Mx_1Cx_1Ux_2Ox_LD.lef}
setImportMode -treatUndefinedCellAsBbox 0 -keepEmptyModule 1 -useLefDef56 1
set init_import_mode {-treatUndefinedCellAsBbox 0 -keepEmptyModule 1 -useLefDef56 1 }
set init_mmmc_file ./src/mmmc.view.tcl
delete_ccopt_clock_tree_spec
create_ccopt_clock_tree -name clk -source Clk_CI
create_ccopt_clock_tree -name clk -source Clk_CI
save_global scripts/Load_design.globals
set init_gnd_net VSS
set init_lef_file {../technology/lef/45RFSOI_8LM_3Mx_1Cx_1Ux_2Ox_LD_tech.lef ../technology/lef/sc9_soi12s0_base_hvt.lef ../technology/lef/sc9_soi12s0_base_svt.lef ../technology/lef/sc9_soi12s0_base_uvt.lef ../technology/lef/io_gppr_45rfsoi_t18_mv10_mv18_avt_pl_8LM_3Mx_1Cx_1Ux_2Ox_LD.lef}
set init_verilog ../synopsys/netlists/Serializer.v
set init_top_cell toplevel
set init_pwr_net VDD
init_design
gui_select -rect {-0.082 0.009 -0.304 -0.112}
panPage 1 0
gui_select -rect {-0.093 -0.034 0.212 0.009}
init_design
uiSetTool select
uiSetTool select
