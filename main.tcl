

#####################################################################
#-------------------------------------------------------------------#
#					Main Script: Serializer n to 1					#
#-------------------------------------------------------------------#
#####################################################################

###############################################
###     Description 
###############################################
###
### Input: Number of inputs of the serializer
### Output: All hardware files, as well as area, 
### 		timing and power reports post-route
###
###############################################

#-----------------------------------
# Number of inputs of the serializer
#-----------------------------------
set n 20

set NAME {8.1.19-4}

# find appropriate nummber for the shift and the tree structure of the serializer

# use the found numbers to adapt the sourcecode of the two serializer structures

# use a toplevel sourcecode to combine the two structures

# run the synthesis in synopsys and create report files in the folder synposys/reports
cd synopsys/
source scripts/serialzer_synthesis.tcl

# use the synthesized model in the backend


