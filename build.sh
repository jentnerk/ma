#!/bin/bash

# written by Kaja Jentner 
# IEF ETH Zuerich

#############################
# DESCRIPTION
#############################
# This script has to be started by the user. It manages the initiation of the different programs (such as synopsys and encounter ...).
# First it will ask the user to fill out the parameters file "parameters.sv", where the number of inputs and outputs of the shift-
# serializer and the number of inputs and outputs of the tree serializer have to be chosen.

#--------------
# set varialbes
#--------------

PATH_MIXED="/home/ma/sourcecode/mixed/"
PATH_TREE="/home/ma/sourcecode/tree_serializer/"
PATH_SHIFT="/home/ma/sourcecode/shift_serializer/"
DCSHELL="synopsys-2017.09 dc_shell -64bit"

NUM_INPUTS=$1

#-------------------------------
# print information for the user
#-------------------------------
echo -e "\nMake sure you are in the /home/ma/ folder."
echo -e "\nBuilding a Serializer with n inputs ..."
echo -e "\nDo you want a serializer that is tree-structered 1, shift-structures 2 or a mix of the two 3? \n"
read number

if [ $number -eq 1 ]; then
	echo -e "\nPlease enter the parameters in the "parameters.vh" file, located at: $PATH_TREE\n"

elif [ $number -eq 2 ]; then
	echo -e "\nPlease enter the parameters in the "parameters.vh" file, located at: $PATH_SHIFT\n"

elif [ $number -eq 3 ]; then
	echo -e "\nPlease enter the parameters in the "parameters.vh" file, located at: $PATH_MIXED\n"
else
	echo -e "\nYour entered number is not valid. Valid numbers are only 1,2,3. Please try again:\n"
	/build.sh
fi



#==========================
# Write constraint file (for designs with tree-structures)
#==========================
if [ $number -eq 1 -o $number -eq 3 ]; then
python generate_constraints.py --number $number
fi

#==========
# Synthesis
#==========
cd synopsys
echo -e "\nCurrently working on synthesizing your design...\n"

# synthesize either mixed_serializer
DCSHELL -f scripts/mixed_serializer_synth.tcl -x exit

# or synthesize only tree structure
DCSHELL -f scripts/tree_serializer_synth.tcl -x exit

# or synthesize only shift structure
DCSHELL -f scripts/shift_serializer_synth.tcl -x exit

#==============
# Place & Route
#==============
cd ../innovus
echo -e "\nCurrently working on placing and routing your design...\n"

