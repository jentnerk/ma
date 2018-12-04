;##########################################################
; Procedure: eosCreateAutofillForm
;###########################################################
; 
; This file derives from eos2-4. Luca, 2016_05_02

procedure(eosCreateAutofillForm()
 prog(
       (
       cDB
       insertFillForm
       )

       cDB=getWindowRep()

       hiCreateAppForm(

               ?name           'insertFillForm
               ?formTitle      "Insert Calibre Autofill Form"
               ?callback       "eosInstantiateFillCells(cDB insertFillForm~>filllib~>value insertFillForm~>fillcell~>value insertFillForm~>instPrefix~>value insertFillForm~>coordinateFile~>value)"
               ?buttonLayout   'OKCancelApply

               ?fields list(
                       list(
                               hiCreateStringField(
                               ?name 'cellName
                               ?prompt "Cell Name"
                               ?value cDB~>cellName
                               ?defValue cDB~>cellName
                               ?editable nil
                               ?callback "")
                               5:0 500:30 100)

                       list(
                               hiCreateStringField(
                               ?name 'libName
                               ?prompt "Library Name"
                               ?value cDB~>libName
                               ?defValue cDB~>libName
                               ?editable nil
                               ?callback "")
                               5:30 500:30 100)

                       list(
                               hiCreateSeparatorField(
                               ?name 'sep1)
                               10:60 490:0 10)

                       list(
                               hiCreateStringField(
                               ?name 'filllib
                               ?prompt "Fill Cell Library"
                               ?value strcat(env(PROJECT_NAME) "_" env(USER))
			       ?defValue strcat(env(PROJECT_NAME) "_" env(USER))
                               ?editable t
                               ?callback "")
                               5:65 500:30 100)

                       list(
                               hiCreateStringField(
                               ?name 'fillcell
                               ?prompt "Fill Cell Name"
                               ?value "1AutoFillUnitCell"
                               ?defValue "1AutoFillUnitCell"
                               ?editable t
                               ?callback "")
                               5:95 500:30 100)

                       list(
                               hiCreateSeparatorField(
                               ?name 'sep2)
                               10:125 490:0 10)

                       list(
                               hiCreateStringField(
                               ?name 'instPrefix
                               ?prompt "Instance Prefix"
                               ?value "autofill"
                               ?defValue "autofill"
                               ?editable t
                               ?callback "")
                               5:130 500:30 100)

                       list(
                               hiCreateStringField(
                               ?name 'coordinateFile
                               ?prompt "Coordinate File"
                               ?value strcat(env(PROJECT) "/" env(USER) "/calibre/drc/fill_coords.txt")
                               ?defValue strcat(env(PROJECT) "/" env(USER) "/calibre/drc/fill_coords.txt")
                               ?editable t
                               ?callback "")
                               5:160 500:30 100)


                       );fields list

       );hiCreateAppForm

       hiDisplayForm(insertFillForm)

 );prog
);procedure


;###########################################################
; Procedure: eosInstantiateFillCells
;###########################################################

procedure(eosInstantiateFillCells( cellDB filllib fillcell instPrefix coordinateFile)
 prog(
       (
	       libName cellName viewName
	       fillDB inst instName
	       parseName
	       instList i
	       instNum instCnt
	       maxCnt
	       xy fillcnt
		   ll_coord_x ll_coord_y
		   ur_coord_x ur_coord_y
		   num_rect
		file_port string_port
		dummy
		array_y_count array_x_count
		cell_count
		current_y_count
		array_start_x array_start_y
		array_pos array_size
		prev_y_array


		array_y_count_list array_x_count_list
		current_y_count_list
		cell_count_list
		array_start_x_list array_start_y_list

		array_y_count_list_old array_x_count_list_old
		current_y_count_list_old
		cell_count_list_old
		array_start_x_list_old array_start_y_list_old

		max_array
		active_array
		array_index
		fill_block_placed
		cycles_since_update
		min_update_interval
		array_update_index 
       )

	if(!cellDB then
               cellDB=getWindowRep()
       );if

	fillDB = dbOpenCellViewByType(filllib fillcell "layout" nil "r")

       if(fillDB then
         print("Loaded fill cell");
       else
         print("ERROR: could not find fill cell");
         return;
       )

if(cellDB then

        libName=cellDB~>libName
        cellName=cellDB~>cellName
        viewName=cellDB~>viewName
        dbReopen(cellDB "a")

        instList=cellDB~>instances~>name
        instCnt=0
        i=1
        maxCnt=0
        while(i <= length(instList)
           instName=nthelem(i instList)
           parseName=parseString(instName "_")
           if(nthelem(1 parseName) == instPrefix then
               instCnt=evalstring(nthelem(2 parseName))
               if(instCnt > maxCnt then
                 maxCnt = instCnt
               );if instCnt
             );if
           i=i+1
        );while i
        instCnt=maxCnt
        fillcnt = 0

        file_port = infile(coordinateFile)

	max_array = 20
	active_array = 0
	cell_count = 0

	cycles_since_update = list(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        array_x_count_list = list(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        array_y_count_list = list(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        cell_count_list = list(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        current_y_count_list = list(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
        array_start_x_list = list( 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ) 
        array_start_y_list = list( 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ) 

        dummy = gets(line file_port)
       while( dummy

                string_port = instring(line)

                dummy = fscanf(string_port "%f %f %f %f %d" ll_coord_x ll_coord_y ur_coord_x ur_coord_y num_rect)

                if( dummy then


			fill_block_placed = nil
			array_index = 0
			while( not(fill_block_placed || (array_index >= (max_array - 0.001)))

				array_index = array_index + 1

				array_start_x = nthelem(array_index array_start_x_list)
				array_start_y = nthelem(array_index array_start_y_list)
				array_x_count = nthelem(array_index array_x_count_list)
				array_y_count = nthelem(array_index array_y_count_list)
				cell_count = nthelem(array_index cell_count_list)
				current_y_count = nthelem(array_index current_y_count_list)

				if(    (   (abs(ll_coord_x - (array_start_x+array_x_count*0.8)) < 0.001)       &&
						(abs(ll_coord_y - array_start_y) < 0.001) 	 ) then
					
					if(  (abs(array_y_count - current_y_count) < 0.001)  then
						array_x_count = array_x_count + 1
						current_y_count = 1
						cell_count = cell_count + 1
					else
						array_pos = list(array_start_x array_start_y)
						array_size = list((array_x_count-1) array_y_count)

						fillcnt = fillcnt+1
						instNum = instCnt + fillcnt
						sprintf(instName "%s_%d" instPrefix instNum)
						inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)

						array_start_x = ll_coord_x-0.8
						array_start_y = ll_coord_y

						array_x_count = 2
						array_y_count = current_y_count
						current_y_count = 1
					)

					fill_block_placed = t

				else
					if(     (       (abs(ll_coord_y - (array_start_y+current_y_count*0.8)) < 0.001)     &&
							(abs(ll_coord_x - (array_start_x+(array_x_count-1)*0.8)) < 0.001) ) then

						fill_block_placed = t


						if( (array_x_count < 1.001) then
							cell_count = cell_count + 1
							array_y_count = array_y_count + 1
							current_y_count = current_y_count + 1
						else
							if( (current_y_count < (array_y_count-0.001)) then
								current_y_count = current_y_count + 1
								cell_count = cell_count + 1
							else
								array_pos = list(array_start_x array_start_y)
								array_size = list((array_x_count-1) array_y_count)

								array_start_x = ll_coord_x
								array_start_y = array_start_y

								array_x_count = 1
								current_y_count = current_y_count + 1
								array_y_count = current_y_count

								cell_count = 1

								; make array
								fillcnt = fillcnt+1
								instNum = instCnt + fillcnt
								sprintf(instName "%s_%d" instPrefix instNum)
								inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)
							)
						)

					else
						array_x_count = 1
						array_y_count = 1
						current_y_count = 1

						array_start_x = ll_coord_x
						array_start_y = ll_coord_y

						cell_count = 1
					)
				)

			) ; end array index while


			if( fill_block_placed  then
				array_start_x_list_old = array_start_x_list
				array_start_y_list_old = array_start_y_list
				array_x_count_list_old = array_x_count_list
				array_y_count_list_old = array_y_count_list
				cell_count_list_old = cell_count_list
				current_y_count_list_old = current_y_count_list

				array_start_x_list = list()
				array_start_y_list = list()
				array_x_count_list = list()
				array_y_count_list = list()
				cell_count_list = list()
				current_y_count_list = list()
				
				array_update_index = max_array
				while( array_update_index > 0.001
					if( (abs(array_update_index - array_index) < 0.001) then
						array_start_x_list = cons(array_start_x array_start_x_list)
						array_start_y_list = cons(array_start_y array_start_y_list)
						array_x_count_list = cons(array_x_count array_x_count_list)
						array_y_count_list = cons(array_y_count array_y_count_list)
						cell_count_list = cons(cell_count cell_count_list)
						current_y_count_list = cons(current_y_count current_y_count_list)
					else
						array_start_x_list = cons(nthelem(array_update_index array_start_x_list_old) array_start_x_list)
						array_start_y_list = cons(nthelem(array_update_index array_start_y_list_old)  array_start_y_list)
						array_x_count_list = cons(nthelem(array_update_index array_x_count_list_old)  array_x_count_list)
						array_y_count_list = cons( nthelem(array_update_index array_y_count_list_old)  array_y_count_list)
						cell_count_list = cons( nthelem(array_update_index cell_count_list_old)  cell_count_list)
						current_y_count_list = cons(nthelem(array_update_index current_y_count_list_old)  current_y_count_list)
					)
					 
					array_update_index = array_update_index - 1
				) ; end array update while
			else

				if( (active_array < (max_array-0.001)) then

					; start keeping track of the new array

					array_start_x_list_old = array_start_x_list
					array_start_y_list_old = array_start_y_list
					array_x_count_list_old = array_x_count_list
					array_y_count_list_old = array_y_count_list
					current_y_count_list_old = current_y_count_list
					cell_count_list_old = cell_count_list

					array_start_x_list = list()
					array_start_y_list = list()
					array_x_count_list = list()
					array_y_count_list = list()
					current_y_count_list = list()
					cell_count_list = list()

					active_array = active_array + 1
					array_index = active_array

					array_update_index = max_array
					while( array_update_index > 0.001
						if( (abs(array_update_index - array_index) < 0.001) then
							array_start_x_list = cons(ll_coord_x array_start_x_list)
							array_start_y_list = cons(ll_coord_y array_start_y_list)
							array_x_count_list = cons(1 array_x_count_list)
							array_y_count_list = cons(1 array_y_count_list)
							current_y_count_list = cons(1 current_y_count_list)
							cell_count_list = cons(1 cell_count_list)
						else
							array_start_x_list = cons(nthelem(array_update_index array_start_x_list_old) array_start_x_list)
							array_start_y_list = cons(nthelem(array_update_index array_start_y_list_old)  array_start_y_list)
							array_x_count_list = cons(nthelem(array_update_index array_x_count_list_old)  array_x_count_list)
							array_y_count_list = cons( nthelem(array_update_index array_y_count_list_old)  array_y_count_list)
							current_y_count_list = cons(nthelem(array_update_index current_y_count_list_old)  current_y_count_list)
							cell_count_list = cons(nthelem(array_update_index cell_count_list_old)  current_y_count_list)
						)

						array_update_index = array_update_index - 1
					) ; end array update while

				else

					; find oldest
					array_update_index = max_array
					min_update_interval = -1
					while( array_update_index > 0.001
						if( (nthelem(array_update_index cycles_since_update) > min_update_interval) then
							min_update_interval = nthelem(array_update_index cycles_since_update)
							array_index = array_update_index
						)

						array_update_index = array_update_index - 1
					) ; end cycle_update

					; pop off oldest info

					array_start_x = nthelem(array_index array_start_x_list)
					array_start_y = nthelem(array_index array_start_y_list)
					array_x_count = nthelem(array_index array_x_count_list)
					array_y_count = nthelem(array_index array_y_count_list)
					current_y_count = nthelem(array_index current_y_count_list)

					if( ((array_y_count > 1.001) || (array_x_count > 1.001)) then
						if( (abs(current_y_count - array_y_count) < 0.001) then

							array_pos = list(array_start_x array_start_y)
							array_size = list(array_x_count array_y_count)

							; make array
							fillcnt = fillcnt+1
							instNum = instCnt + fillcnt
							sprintf(instName "%s_%d" instPrefix instNum)
							inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)

						else
							if( (current_y_count < (array_y_count - 0.001)) then

								; make 1rst array
								array_pos = list(array_start_x array_start_y)
								if( (abs(array_x_count) < 1.001) then
									array_size = list(1 array_y_count)
								else
									array_size = list((array_x_count-1) array_y_count)
								)

								fillcnt = fillcnt+1
								instNum = instCnt + fillcnt
								sprintf(instName "%s_%d" instPrefix instNum)
								inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)

								; make 2nd array
								array_pos = list(array_start_x+0.8*(array_x_count-1)     array_start_y)
								fillcnt = fillcnt+1
								instNum = instCnt + fillcnt
								sprintf(instName "%s_%d" instPrefix instNum)
								if( (current_y_count > 1.001) then
									array_size = list(1             current_y_count)
									inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)
								else
									inst=dbCreateInst(cellDB fillDB instName array_pos "R0" 1)
								)

							else
								println("what happened")
							)
						) ; end current_y_cound == array_y_count if
					else
						array_pos = list(array_start_x     array_start_y)

						; make 2nd array
						fillcnt = fillcnt+1
						instNum = instCnt + fillcnt
						sprintf(instName "%s_%d" instPrefix instNum)
						inst=dbCreateInst(cellDB fillDB instName array_pos "R0" 1)
					) ; end if mosaic if

					; start keeping track of the new array in the refresh location

					array_start_x_list_old = array_start_x_list
					array_start_y_list_old = array_start_y_list
					array_x_count_list_old = array_x_count_list
					array_y_count_list_old = array_y_count_list
					current_y_count_list_old = current_y_count_list
					cell_count_list_old = cell_count_list

					array_start_x_list = list()
					array_start_y_list = list()
					array_x_count_list = list()
					array_y_count_list = list()
					current_y_count_list = list()
					cell_count_list = list()

                                        array_update_index = max_array
                                        while( array_update_index > 0.001
                                                if( (abs(array_update_index - array_index) < 0.001) then
							array_start_x_list = cons(ll_coord_x array_start_x_list)
							array_start_y_list = cons(ll_coord_y array_start_y_list)
							array_x_count_list = cons(1 array_x_count_list)
							array_y_count_list = cons(1 array_y_count_list)
							current_y_count_list = cons(1 current_y_count_list)
							cell_count_list = cons(1 cell_count_list)
                                                else
                                                        array_start_x_list = cons(nthelem(array_update_index array_start_x_list_old) array_start_x_list)
                                                        array_start_y_list = cons(nthelem(array_update_index array_start_y_list_old)  array_start_y_list)
                                                        array_x_count_list = cons(nthelem(array_update_index array_x_count_list_old)  array_x_count_list)
                                                        array_y_count_list = cons( nthelem(array_update_index array_y_count_list_old)  array_y_count_list)
                                                        current_y_count_list = cons(nthelem(array_update_index current_y_count_list_old)  current_y_count_list)
                                                        cell_count_list = cons(nthelem(array_update_index cell_count_list_old)  current_y_count_list)
                                                )

                                                array_update_index = array_update_index - 1
                                        ) ; end array update while


				) ; end array < max array if

			) ; end fill block_placed if

			cycles_since_update_old = cycles_since_update
			cycles_since_update = list()

			array_update_index = max_array
			while( array_update_index > 0
				if( (abs(array_update_index-array_index) < 0.001) then
					cycles_since_update = cons(0.0 cycles_since_update)
				else
					cycles_since_update = cons((nthelem(array_update_index cycles_since_update_old) + 1) cycles_since_update)
				)

				array_update_index = array_update_index - 1
			) ; end cycle_update

                else
                        print("ERROR parsing file line")
                )

                dummy = gets(line file_port)

        );while
        close(file_port)


        ; instantiate the open cell instance(s)


	array_index = 0
	while( (array_index < active_array)

		array_index = array_index + 1

		array_start_x = nthelem(array_index array_start_x_list)
		array_start_y = nthelem(array_index array_start_y_list)
		array_x_count = nthelem(array_index array_x_count_list)
		array_y_count = nthelem(array_index array_y_count_list)
		current_y_count = nthelem(array_index current_y_count_list)

		if( ((array_y_count > 1.001) || (array_x_count > 1.001)) then

			if( (current_y_count == array_y_count) then

				array_pos = list(array_start_x array_start_y)
				array_size = list(array_x_count array_y_count)

				; make array
				fillcnt = fillcnt+1
				instNum = instCnt + fillcnt
				sprintf(instName "%s_%d" instPrefix instNum)
				inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)

			else
				if( (current_y_count < array_y_count) then

					; make 1rst array
					array_pos = list(array_start_x array_start_y)
						if( (array_x_count == 0) then
							array_size = list(1 array_y_count)
						else
							array_size = list((array_x_count-1) array_y_count)
						)

					fillcnt = fillcnt+1
					instNum = instCnt + fillcnt
					sprintf(instName "%s_%d" instPrefix instNum)
					inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)

					; make 2nd array
					array_pos = list(array_start_x+0.8*(array_x_count-1)     array_start_y)
					fillcnt = fillcnt+1
					instNum = instCnt + fillcnt
					sprintf(instName "%s_%d" instPrefix instNum)
					if( (current_y_count > 1.001) then
						array_size = list(1             current_y_count)
						inst=dbCreateSimpleMosaic(cellDB fillDB instName array_pos "R0" cadr(array_size) car(array_size) 0.8 0.8)
					else
						inst=dbCreateInst(cellDB fillDB instName array_pos "R0" 1)
					)

				else
					println("what happened")
				)
			)

		else

			array_pos = list(array_start_x     array_start_y)

			; make 2nd array
			fillcnt = fillcnt+1
			instNum = instCnt + fillcnt
			sprintf(instName "%s_%d" instPrefix instNum)
			inst=dbCreateInst(cellDB fillDB instName array_pos "R0" 1)

		)

	); end final cycle through open array while loop

	println(instName)

else
 print("Some error with cell DB")
);if cellDB

 );prog
);procedure

;###########################################################
; Procedure: eosRemoveAutofillForm
;###########################################################

procedure(eosRemoveAutofillForm()
 prog(
       (
       cDB
       delFillForm
       )

       cDB=getWindowRep()

       hiCreateAppForm(

               ?name           'delFillForm
               ?formTitle      "Delete Cell Autofill Form"
               ?callback       "eosDeleteFillCells(cDB delFillForm~>instPrefix~>value)"
               ?buttonLayout   'OKCancelApply

               ?fields list(
                       list(
                               hiCreateStringField(
                               ?name 'cellName
                               ?prompt "Cell Name"
                               ?value cDB~>cellName
                               ?defValue cDB~>cellName
                               ?editable nil
                               ?callback "")
                               5:0 500:30 100)

                       list(
                               hiCreateStringField(
                               ?name 'libName
                               ?prompt "Library Name"
                               ?value cDB~>libName
                               ?defValue cDB~>libName
                               ?editable nil
                               ?callback "")
                               5:30 500:30 100)

                       list(
                               hiCreateSeparatorField(
                               ?name 'sep2)
                               10:65 490:0 10)

                       list(
                               hiCreateStringField(
                               ?name 'instPrefix
                               ?prompt "Instance Prefix"
                               ?value "autofill"
                               ?defValue "autofill"
                               ?editable t
                               ?callback "")
                               5:70 500:30 100)


                       );fields list

       );hiCreateAppForm

       hiDisplayForm(delFillForm)

 );prog
);procedure


;###########################################################
; Procedure: eosDeleteFillCells
;###########################################################

procedure(eosDeleteFillCells( cellDB instPrefix )
 prog(
       (
       libName cellName viewName
       fillDB inst instName
       parseName
       instList i
       instNum instCnt
       maxCnt
       xy 
       fillcnt
	   ll_coord_x ll_coord_y
	   ur_coord_x ur_coord_y
	   num_rect
		file_port string_port
		dummy
	output_string
       )

       if(!cellDB then
               cellDB=getWindowRep()
       );if

       if(cellDB then

        libName=cellDB~>libName
        cellName=cellDB~>cellName
        viewName=cellDB~>viewName
        dbReopen(cellDB "a")

        instList=cellDB~>instances

	i = 1
        while(i <= length(instList)
           inst=nthelem(i instList)
	   instName = inst~>name
           parseName=parseString(instName "_")
           if(nthelem(1 parseName) == instPrefix then
		; Delete the fill cell
		  dbDeleteObject(inst)
;		 sprintf(output_string "Deleted instance %L" instName)
;		  println(output_string)
             );if
           i=i+1
        );while i

	else
	 print("Some error with cell DB")
       );if cellDB

 );prog
);procedure


;###########################################################
; Procedure: eosRepositionPCellsForm
;###########################################################

procedure(eosRepositionPCellsForm()
 prog(
       (
       cDB
       posPCellsForm
       )

       cDB=getWindowRep()

       hiCreateAppForm(

               ?name           'posPCellsForm
               ?formTitle      "Set Correct PCell Transform Properties"
               ?callback       "eosRepositionPCells(cDB)"
               ?buttonLayout   'OKCancelApply

               ?fields list(
                       list(
                               hiCreateStringField(
                               ?name 'cellName
                               ?prompt "Cell Name"
                               ?value cDB~>cellName
                               ?defValue cDB~>cellName
                               ?editable nil
                               ?callback "")
                               5:0 500:30 100)

                       list(
                               hiCreateStringField(
                               ?name 'libName
                               ?prompt "Library Name"
                               ?value cDB~>libName
                               ?defValue cDB~>libName
                               ?editable nil
                               ?callback "")
                               5:30 500:30 100)


                       );fields list

       );hiCreateAppForm

       hiDisplayForm(posPCellsForm)

 );prog
);procedure


;###########################################################
; Procedure: eosRepositionPCells
;###########################################################

procedure(eosRepositionPCells( cellDB )
 prog(
       (
       libName cellName viewName
       fillDB inst instName
       parseName
       instList i
       instNum instCnt
       maxCnt
       fillcnt
	instCellName
	instXOrigin
	instYOrigin
	instRotation
	   ll_coord_x ll_coord_y
	   ur_coord_x ur_coord_y
	   num_rect
		file_port string_port
		dummy
       )

       if(!cellDB then
               cellDB=getWindowRep()
       );if

       if(cellDB then

        libName=cellDB~>libName
        cellName=cellDB~>cellName
        viewName=cellDB~>viewName
        dbReopen(cellDB "a")

        instList=cellDB~>instances

	i = 1
        while(i <= length(instList)
           inst=nthelem(i instList)
	   instCellName = inst~>cellName
	   if( 		(	(strcmp("resonator_cell" instCellName) == 0) 		||
				(strcmp("resonator_rotated_cell" instCellName) == 0)	||
				(strcmp("resonator_ADC_cell" instCellName) == 0)	||
				(strcmp("paperclip_simple_cell"	instCellName) == 0)	||
				(strcmp("wg_cell" instCellName) == 0)			) then
		instXOrigin = car(inst~>xy)
		instYOrigin = cadr(inst~>xy) 
		instRotation = cadr(inst~>transform)

		dbReplaceProp(inst "cell_pc_x_origin" "float" instXOrigin)
		dbReplaceProp(inst "cell_pc_y_origin" "float" instYOrigin)
		dbReplaceProp(inst "cell_pc_rotation" "string" instRotation)
	   )
		if( 		(	(strcmp("wg_bend" instCellName) == 0) 		||
				(strcmp("wg_offset" instCellName) == 0) 		||
				(strcmp("wg_taper" instCellName) == 0) 		||
				(strcmp("splitter_3dB_1200nm" instCellName) == 0) 		||
				(strcmp("coupler" instCellName) == 0) 		||
				(strcmp("wg_45_degree" instCellName) == 0) 		||
				(strcmp("wg_bend_45_degree" instCellName) == 0) 		||
				(strcmp("ring" instCellName) == 0) 		||
				(strcmp("wg" instCellName) == 0)			||
				(strcmp("wg_cu" instCellName) == 0) 		||
				(strcmp("wgArc_cu" instCellName) == 0)		||
				(strcmp("wgTaper_cu" instCellName) == 0) 		||
				(strcmp("wgOffset_cu" instCellName) == 0)		) then
		instXOrigin = car(inst~>xy)
		instYOrigin = cadr(inst~>xy) 
		instRotation = cadr(inst~>transform)

		if(inst~>pc_x_origin then
			dbReplaceProp(inst "pc_x_origin" "float" instXOrigin)
		else
			dbCreateProp(inst "pc_x_origin" "float" instXOrigin)
		)
		if(inst~>pc_y_origin then
			dbReplaceProp(inst "pc_y_origin" "float" instYOrigin)
		else
			dbCreateProp(inst "pc_y_origin" "float" instYOrigin)
		)
		if(inst~>pc_rotation then
			if( instRotation then
				dbReplaceProp(inst "pc_rotation" "string" instRotation)
			else
				dbReplaceProp(inst "pc_rotation" "string" "R0")
			)
		else
			if( instRotation then
				dbCreateProp(inst "pc_rotation" "string" instRotation)
			else
				dbCreateProp(inst "pc_rotation" "string" "R0")
			)
		)
	   )

           i=i+1
        );while i

	else
	 print("Some error with cell DB")
       );if cellDB

 );prog
);procedure
