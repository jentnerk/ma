#!/bin/csh

# v0.4 - <muheim@ee.ethz.ch> - Wed Nov  7 15:37:17 CET 2018
#  - new pdk V1.1_0.2
# v0.3 - <muheim@ee.ethz.ch> - Thu Jun 14 08:50:45 CEST 2018
#  - new pdk V1.0_1.1
# v0.2 - <muheim@ee.ethz.ch> - Thu May 17 10:35:33 CEST 2018
#  - adding the DO_ASIC_IP_RULES switch
# v0.1 - <muheim@ee.ethz.ch> - Fri Feb  9 09:19:40 CET 2018
# - copy from 11LM_3Mx_2Cx_3Bx_2Ux_LB__V1.0_0.2 (this was from 10LM_3_20_30_00_00_02_LB__V1.6.0.10IBM__vpg_eos30)


setenv GF_PDK_HOME "/usr/pack/gf-45soi-kgf/gf/45RFSOI-RF/V1.1_0.2"
setenv BEOL_STACK "8LM_3Mx_1Cx_1Ux_2Ox_LD"


## DRC/LVS/PEX (calibre)

# Calibre directory base location decks and runsets
#setenv TECHDIR $PDK_HOME/Calibre/

# Calibre default runsets
#setenv MGC_CALIBRE_DRC_RUNSET_FILE "../calibre/drc/runset.drc"
#setenv MGC_CALIBRE_LVS_RUNSET_FILE "../calibre/lvs/runset.lvs"
# setenv MGC_CALIBRE_PEX_RUNSET_FILE "../calibre/pex/runset.pex"
  # for dfii the *_RUNSET_FILE env variable will be set by the IBM_PDK menu.
  # for loading calibre standalone it have to be loaded, so this well be set in "start_calibre".

## DRC
# for info to the environment variables see: 
#   /usr/pack/gf-45soi-kgf/gf/45RFSOI-RF/V1.1_0.2/DRC/Calibre/doc/45RFSOI.CalibreDRC.rel_notes.pdf
#   /usr/pack/gf-45soi-kgf/gf/45RFSOI-RF/V1.1_0.2/DRC/Calibre/Include/45rfsoi_config.drc.cal

# SECTION(1): SETUP SPECIFICATION
#setenv LAYOUT_SYSTEM GDSII
#setenv BATCH 
#setenv EXCLUDE_CELLS
#setenv EXCEPTION_RDB srules_errors.rdb
#setenv SRULES_RDB srules_errors.rdb
#setenv CELL_SPACE 

# SECTION(2): DESIGN SWITCHES
setenv DESIGN_TYPE CELL
setenv ORIENTATION VERTICAL
setenv PACKAGE WIREBOND
setenv IOTYPE INLINE
#setenv DO_NO_BAT_RULES NO
#setenv DO_DENSITY_GUARDBAND NO

# SECTION(4): SELECTIVE CONTROL SWITCHES
#setenv SELECT
#setenv UNSELECT
#setenv DO_FEOL YES
#setenv DO_BEOL YES
#  setenv DO_BOTH 
setenv DO_PREDICTIVE_DENSITY NO
setenv DO_POST_FILL_CHECKING NO
#setenv DO_SRULES YES
#setenv DO_131 YES
#setenv ANTENNA_OUTPUT_ALL_GATES NO
#setenv GR131soi NONE
#setenv DO_131_BI YES
#setenv DO_OPTPS NO
#setenv DO_NWSTRESS NO
#setenv LIMIT_PWR_ON_OFF NO
#setenv RECOMMENDED_RULES

setenv DO_ASIC_IP_RULES YES
  # we have set this to yes, otherwise the arm stc do not pas the DRC


## LVS
# for info to the environment variables see: 
#   /usr/pack/gf-45soi-kgf/gf/45RFSOI-RF/V1.1_0.2/DRC/Calibre/doc/45RFSOI.CalibreDRC.rel_notes.pdf


setenv IMAGE_TYPE WB
#setenv REDUCE_SPLIT_GATES FALSE
#setenv SHORT_EQUIV_NODES FALSE
#setenv COMPARE_CASE FALSE
#setenv CHECK_SUB_CONNECTIONS FALSE
#setenv CHECK_MOSFET_GCON_PARAM TRUE
#setenv PEX_RUN FALSE
#setenv CHECK_TRUTHTABLE FALSE
#setenv STRESS FALSE
#setenv STRESSFILE
#setenv LVS_PUSH_DEVICES TRUE


# ## PEX
# # we need the following env variable set,
# # don;t know if it interferes with normal calibre
# #setenv PEX_RUN TRUE

