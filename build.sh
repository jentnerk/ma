#!/bin/sh

DCSHELL="synopsys-2017.09 dc_shell -64bit"

NUM_INPUTS=$1

echo Generate serializer with $NUM_INPUTS inputs.

# Generate constraint file
# Example:
# python myConstraintGenerator.py --num-inputs $NUM_INPUTS

cd synopsys
$DCSHELL -f scripts/serializer_synth.tcl -x exit
