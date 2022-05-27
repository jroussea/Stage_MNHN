#!/bin/bash

#PBS -q beta
#PBS -l select=2:ncpus=24
#PBS -l walltime=72:00:00
#PBS -N seq_len_known

cd /scratchbeta/rousseau

echo "seq_len_known" > seq_len_known.txt


while read line1
do

if [[ ${line1:0:1} == '>' ]]
then
echo $len1 >> seq_len_known.txt
len1=0
rm -f temporary_file1.txt
touch temporary_file1.txt
else
echo $line1 > temporary_file1.txt
LenLine1=`wc -m temporary_file1.txt | cut -d " " -f 1`
len1=$(($len1 + $LenLine1 - 1))
fi

done < sequence_known.faa

echo $len1 >> seq_len_known.txt

