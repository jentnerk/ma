; v0.5 - <muheim@ee.ethz.ch> - Mon May  7 14:51:16 CEST 2018
;  - move the read of the global variable 'gfPdkHome' to ".cdsinit".
;  - fix the envSetVal for 'sfactorNames' and  'mfactorNames'
; v0.4 - <muheim@ee.ethz.ch> - Fri May  4 17:41:25 CEST 2018
;  - change the tech library for new librarys "45RFSOI_tech"
; v0.3 - <muheim@ee.ethz.ch> - Tue Feb  6 16:22:18 CET 2018
;  - change tho the gf pdk
; v0.2 - <muheim@ee.ethz.ch> - Wed Oct  5 10:16:03 CEST 2016
;  - add schSetEnv 'tsgTemplateType' copy from Luca Alloatti ".cdsini"
; v0.1 - <muheim@ee.ethz.ch> - Wed Sep 21 10:06:16 CEST 2016
;  - copy from tsmc40, adapted it
;  - take SnapSpacing from /usr/pack/gf-45soi-kgf/IBM_PDK/soi12s0/V1.6.0.10IBM/cdslib/examples/.cdsenv
;  - add spectre modelFiless settings

; 610 settings
envSetVal( "ui"  "webBrowser" 'string  "/usr/bin/firefox")
envSetVal( "graphic" "schematicDefaultApp" 'string  "Schematics XL")
envSetVal( "graphic" "maskLayoutDefaultApp"  'string  "Layout L")


; after 6.13.515 the following will work
;   http://support.cadence.com/wps/myportal/cos/COSHome/viewsolution/!ut/p/a1/tY_NboMwEISfhXsqr8HE5Og2FRQIKC1RMZcIGjexEhvET6Tm6WtHkXpKe-redvbbmV1UoRJVuj7LfT3KVtcn21fz7Qt-JjjKIQ4X7AkY0HW8SbCbUN8A3ABwpxj8tf-OqivyiwM3EfTHI0jTBbAwmb9GtPAgp2ij216ZY9-s106ILpX6iPjYT8Iqy_ZjUkKPxVcnjNoMh1HvZ7tPKe10aE-TfTabVCN6xDH2A0qwe4v1oyWBGHCcP7oUWFSQkGQphtz9p9hOlfDAVeCp7aoQzYUxx_kG1VI85A!!/dl5/d5/L2dBISEvZ0FBIS9nQSEh/
envSetVal( "license" "VLSL_UseNextLicense"   'string "always")
envSetVal( "license" "VLSXL_UseNextLicense"  'string "always")
envSetVal( "license" "VSEL_UseNextLicense"   'string "always")
envSetVal( "license" "ADEL_UseNextLicense"   'string "always")
envSetVal( "license" "ADEXL_UseNextLicense"  'string "always")

; even more funny things
envSetVal( "license" "VLSLicenseCheckoutOrder" 'string "GXL,XL,L")
envSetVal( "license" "VSELicenseCheckoutOrder" 'string "XL,L")
envSetVal( "license" "ADELicenseCheckoutOrder" 'string "GXL,XL,L")

; from /usr/pack/gf-45soi-kgf/IBM_PDK/soi12s0/V1.6.0.10IBM/cdslib/examples/.cdsenv
envSetVal( "layout"  "instLibName"  'string  "45RFSOI")
envSetVal( "layout"  "xSnapSpacing" 'float  0.001)
envSetVal( "layout"  "ySnapSpacing" 'float  0.001)

envSetVal( "layoutXL"  "sfactorNames" 'string  "sc SC")
envSetVal( "layoutXL"  "mfactorNames" 'string  "mc MC")

; load library display resource file
envSetVal( "graphic" "drfPath" 'string  strcat( gfPdkHome "DesignEnv/VirtuosoOA/setup/display.drf" )  )

; new library should be linked to this tech library
tcNewLibAttachTechForm->attachTechLibList->value= '( "45RFSOI" )

; loadContext(prependInstallPath("etc/context/transUI.cxt"))
; streamInKeys->layerTable="/usr/pack/umc-65-kgf/dz/dfii/610/tech/streamIn.map"
; streamInKeys->textFontTable="/usr/pack/umc-90-kgf/faraday.dz/dfii/5141/pipo/txtfont.tab"

; the following is to keep reference libraries
; streamInKeys->refLib=t
; streamInKeys->refLibOrder="<reference libraries>"

; streamOutKeys->layerTable="/usr/pack/umc-65-kgf/dz/dfii/610/tech/stream.map"
;streamOutKeys->textFontTable="/usr/pack/umc-90-kgf/faraday.dz/dfii/5141/pipo/txtfont.tab"
streamOutKeys->runDirectory="."
streamOutKeys->errorMessageFile="PIPO.LOG"


;; simulation and model library setup (spectre)
;setShellEnvVar("CDS_Netlisting_Mode=Analog")
setShellEnvVar("CDS_AUTO_64BIT=ALL")
cdsSetNetlistMode()
envSetVal("spectre.envOpts" "modelFiles" 'string
  strcat(
    gfPdkHome "/Models/Spectre/design.scs "
    gfPdkHome "/Models/Spectre/allModels.scs "
    gfPdkHome "/Models/Spectre/relxpert/reliability.scs")
)
envSetVal("spectre.envOpts" "includePath" 'string strcat(gfPdkHome "/Models/Spectre"))


;
; Schematic cellview to cellview defaults for creating a symbol with Artist
; IL interpreted labels. The default is to not create an Artist symbol.
;
schSetEnv( "tsgTemplateType" "artist" )
