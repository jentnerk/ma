#!/bin/bash

#script extracts AT values from a bunch of synthesis reports with the same basename
#make sure that only one report_area and report_timing command was issued per file

cd "$(dirname "${BASH_SOURCE[0]}")"


#change the basename here, if you want to use different rep files
RPRT_BASENAME=shift_serializer_8.1.19-3

OUTPUT_FILE=$RPRT_BASENAME"_at_values.dat"

rm -f $OUTPUT_FILE

touch $OUTPUT_FILE

for FILE in ../reports/*"$RPRT_BASENAME"*.rep; do

	AREA=`grep "Total cell area:" $FILE | sed -e "s/[^(0-9.)]//g"`
	SLACK=`grep "slack (" $FILE | sed -e "s/[^-0-9.]//g"`
	CLK=`grep -E '^\s*clock.*?\(rise edge\)' $FILE | grep -Eo '[0-9]+\.[0-9]+\s*$' | tail -n 1`


	echo "$CLK $SLACK  $AREA" >> $OUTPUT_FILE

done
