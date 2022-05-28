#!/bin/bash

#PBS -q beta
#PBS -l select=1:ncpus=24
#PBS -l walltime=72:00:00
#PBS -N seq_len_unknown

# data path
cd /scratchbeta/rousseau

echo "sequence_length_unknown" > sequence_length_unknown.txt

while read line
do

if [[ ${line:0:1} == '>' ]]
then
echo $len >> sequence_length_unknown.txt
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

done < sequence_unknown.faa

echo $len >> sequence_length_unknown.txt


