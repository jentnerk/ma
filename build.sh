#!/bin/bash

##############################
#
# written by Kaja Jentner 
# IEF ETH Zuerich
#
##############################

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
echo -e "\nMake sure you are in the /home/ma/ folder.\n"
echo -e "Building a Serializer with n inputs ...\n"
echo -e "Do you want a serializer that is tree-structered 1, shift-structures 2 or a mix of the two 3? \n"
read number

if [ $number -eq 1 ]; then
	echo -e "\nPlease enter the parameters in the << parameters.vh >> file, located at: $PATH_TREE\n"

elif [ $number -eq 2 ]; then
	echo -e "\nPlease enter the parameters in the << parameters.vh >> file, located at: $PATH_SHIFT\n"

elif [ $number -eq 3 ]; then
	echo -e "\nPlease enter the parameters in the << parameters.vh >> file, located at: $PATH_MIXED\n"
else
	echo -e "\nYour entered number is not valid. Valid numbers are only 1,2,3. Please try again:\n"
	/build.sh
fi



#==========================
# Write constraint file 
# (for designs with tree-structures)
#==========================
if [ $number -eq 1 -o $number -eq 3 ]; then
python generate_constraints.py --tree_inputs 2
fi

#==========
# Synthesis
#==========
cd synopsys
echo -e "Currently working on synthesizing your design...\n\n"

# synthesize either mixed_serializer
if [ $number -eq 1 ]; then
$DCSHELL -f scripts/fast_synth_tree.tcl
fi

# or synthesize only tree structure
if [ $number -eq 2 ]; then
$DCSHELL -f scripts/shift_serializer_synth.tcl -x exit
fi

# or synthesize only shift structure
if [ $number -eq 3 ]; then
$DCSHELL -f scripts/mixed_serializer_synth.tcl -x exit
fi

#==============
# Place & Route
#==============
cd ../innovus
echo -e "\nCurrently working on placing and routing your design...\n"
