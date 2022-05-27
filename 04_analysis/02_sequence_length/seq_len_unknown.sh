#!/bin/bash

#PBS -q beta
#PBS -l select=1:ncpus=24
#PBS -l walltime=72:00:00
#PBS -N seq_len_unknown

cd /scratchbeta/rousseau

echo "seq_len_unknown" > seq_len_unknown.txt

while read line2
do

if [[ ${line2:0:1} == '>' ]]
then
echo $len2 >> seq_len_unknown.txt
len2=0
rm -f temporary_file2.txt
touch temporary_file2.txt
else
echo $line2 > temporary_file2.txt
LenLine2=`wc -m temporary_file2.txt | cut -d " " -f 1`
len2=$(($len2 + $LenLine2 - 1))
fi

done < sequence_known.faa

echo $len2 >> seq_len_unknown.txt


