#!/bin/bash

# retrieve only sequence name
while read line1
do

if [[ ${line1:0:1} == '>' ]]
then
echo $line1 >> seq_name_unknown.txt
fi

done < sequence_unknown.faa file # containing all unknown sequences

# retrieve only sequence name
while read line2
do

if [[ ${line2:0:1} == '>' ]]
then
echo $line2 >> seq_name_known.txt
fi

done < sequence_known.faa # file containing all known sequences
