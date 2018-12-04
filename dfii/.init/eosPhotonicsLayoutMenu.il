;
; Originally taken from eos2-4. Luca, 2016_05_02
;

;###########################################################
;
; Menu Items
;
;###########################################################

;###########################################################
; Autofill Menu Items
;###########################################################

  eosCreateAutofillF =
  hiCreateMenuItem(?name 'eosCreateAutofillF
                   ?itemText "Generate from Calibre Output..."
                   ?callback "eosCreateAutofillForm()"
                  )

  eosRemoveAutofillF =
  hiCreateMenuItem(?name 'eosRemoveAutofillF
                   ?itemText "Remove from Cellview..."
                   ?callback "eosRemoveAutofillForm()"
                  )

  eosRepositionPCellsF =
  hiCreateMenuItem(?name 'eosRepositionPCellsF
                   ?itemText "Set PCell Origins..."
                   ?callback "eosRepositionPCellsForm()"
                  )

;###########################################################
; Toolbox Menus
;###########################################################

; ****** Autofill Sub Menu ******
  eosAutofillMenu =
  hiCreatePulldownMenu( 'eosAutofillMenu
                  "Autofill Tool Box"
                  list(
                    eosCreateAutofillF
                    eosRemoveAutofillF
                  )
                  ""
  )

  eosAutofillMenuF =
  hiCreateSliderMenuItem(?name 'eosAutofillMenuF
                        ?itemText "Autofill Tool Box"
                        ?subMenu eosAutofillMenu
                        )

; ****** Main Menu ******

  eosPhotonicsLayoutMenu =
  hiCreatePulldownMenu( 'eosPhotonicsLayoutMenu
                  "Photonics"
                  list(
                    eosAutofillMenuF
		    eosRepositionPCellsF
                  )
                  ""
  )

;###########################################################
; eosLoadPhotonicsLayoutMenu Procedure
;###########################################################

procedure(eosLoadPhotonicsLayoutMenu(l_args)
prog( (existingMenu newMenu viewtype prevmenu)

        ; define the menu if needed
        newMenu = eosPhotonicsLayoutMenu

	return( list(newMenu) )

 );prog
);procedure

;###########################################################
; eosSetupLayoutMenuTrigger()
;###########################################################
procedure( eosSetupLayoutMenuTrigger()
prog( (prevAppTrigger prevMenuTrigger prevPostInstallTrigger layoutMenuViewType viewtype appinfo newstyle)

	layoutMenuViewType = list("maskLayout" "maskLayoutXL" "maskLayoutGXL")

        newstyle = nil

        ; Get any existing trigger(s)
        foreach( viewtype layoutMenuViewType

                when(appinfo=deGetAppInfo(viewtype)

			prevAppTrigger          = get( appinfo 'userAppTrigger )
			prevMenuTrigger         = get( appinfo 'userMenuTrigger )
			prevPostInstallTrigger  = get( appinfo 'userPostInstallTrigger )

			;If there are previously defined menu triggers then unregister them.
			;This if is here to make sure the user does not see a WARNING message.
			;if( (prevAppTrigger!=nil) || (prevMenuTrigger!=nil) || (prevPostInstallTrigger!=nil) then
			;	deUnRegUserTriggers( viewtype )
			;)

			; Register the new trigger which will contain the old trigger, if any.
			deRegUserTriggers( viewtype prevAppTrigger 'eosLoadPhotonicsLayoutMenu prevPostInstallTrigger )

		;	unless( mgcCadenceVersion4_3 putprop(list(nil) prevMenuTrigger viewtype) )
                )
        )
 );prog
);procedure

;###########################################################
; Call Procedures
;###########################################################

eosSetupLayoutMenuTrigger()

