#!/bin/bash

#PBS -q beta
#PBS -l select=2:ncpus=24
#PBS -l walltime=72:00:00
#PBS -N sequence_length_known

# data path
cd /scratchbeta/rousseau


echo "sequence_length_known" > sequence_length_known.txt


while read line
do

if [[ ${line:0:1} == '>' ]]
then
echo $len >> sequence_length_known.txt
len=0 # size initialization
rm -f temporary_file.txt
touch temporary_file.txt
else
# to calculate the size of the sequence,
# we count the number of characters of each line of this sequence in the file and we do the sum
echo $line > temporary_file.txt
LenLine=`wc -m temporary_file.txt | cut -d " " -f 1`
len=$(($len + $LenLine - 1))
fi

done < sequence_known.faa

echo $len >> sequence_length_known.txt

