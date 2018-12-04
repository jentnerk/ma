; v0.1 - <muheim@ee.ethz.ch> - Fri Sep 16 09:39:14 CEST 2016
;  - copy from tsmc40 v0.1


printf("DZ: BEGIN OF CALIBRE INTERACTIVE LOADING\n")


; Load the env variables
load("/usr/pack/calibre-2017.4-kgf/DZ_STUFF/skill/calibre_env.il")

;
; check MGC_HOME
;
mgc_home=getShellEnvVar("MGC_HOME")

if( mgc_home!=nil && isDir(mgc_home) && isReadable(mgc_home) then

    ; Load calibre.skl or calibre.4.3.skl, not both!

    ; Load calibre.skl for Cadence versions 4.4 and greater
    load(strcat(mgc_home "/lib/calibre.skl"))


else

    ; MGC_HOME is not set correctly. Report the problem.

    printf("//  Calibre Error: Environment variable ")

    if( mgc_home==nil || mgc_home=="" then
        printf("MGC_HOME is not set.");
    else
        if( !isDir(mgc_home) then
            printf("MGC_HOME does not point to a directory.");
        else
            if( !isReadable(mgc_home) then
                printf("MGC_HOME points to an unreadable directory.");
            )
        )
    )
    printf(" Calibre Skill Interface not loaded.\n")

    ; Display a dialog box message about load failure.

    hiDisplayAppDBox(
        ?name           'MGCHOMEErrorDlg
        ?dboxBanner     "Calibre Error"
        ?dboxText       "Calibre Skill Interface not loaded."
        ?dialogType     hicErrorDialog
        ?dialogStyle    'modal
        ?buttonLayout   'Close
    )
)

;;;  end some variables:
mgc_eview_globals->cellMapFile = "../calibre/pex/calview.cellmap"
mgc_eview_globals->deviceViewScale = 1.0
mgc_eview_globals->parasiticViewScale = 1.0
mgc_eview_globals->extViewName = "extracted"
;;mgc_eview_globals->extViewType = "maskLayout"
mgc_eview_globals->extViewType = "schematic"

;; seting for the Layout Export - calibre
;streamOutKeys->runDir = "."
  ; is ready set in "loadKit.il"

;;; these are the empty subcircuits
mgc_rve_init_cdlout_keys()
;; JAT says this should be empty_subckt.sp
;; Wed Jan 27 15:12:23 CET 2010
;;cdlOutKeys->incFILE = "/usr/pack/smic-130-kgf/dz/calibre/2008.3/lvs/empty_rf_subckt.sp"
;;cdlOutKeys->incFILE = "/usr/pack/smic-130-kgf/dz/calibre/2008.3/lvs/empty_subckt.sp"

;; alternative trick
;;mgc_calibre_export_netlist_template_file ="/usr/pack/smic-130-kgf/dz/calibre/2008.3/dfii/mgc_export_template.il"
;;mgc_rve_load_export_netlist_template_file()

printf("DZ: END OF CALIBRE INTERACTIVE LOADING\n")

