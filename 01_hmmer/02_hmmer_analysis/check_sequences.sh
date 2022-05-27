#!/bin/bash

#PBS -q beta
#PBS -l select=1:ncpus=1
#PBS -l walltime=24:00:00
#PBS -N check_sequences_?

# data path
cd /scratchbeta/rousseau/Tara_Ocean

date

mkdir sequence_known
mkdir sequence_unknown

touch sequence_known/sequence_known_?.faa
touch sequence_unknown/sequence_unknown_?.faa

# this loop makes it possible to separate, in each .faa file,
# the sequences possessing one (or more) HMM profiles from the sequences not possessing any.
while read line
do

if [[ ${line:0:1} == '>' ]]
then
echo ${line:1:$((${#line}-0))} > temporary_file_?.txt
IDline=`cat temporary_file_?.txt`

grep $IDline data?.crh.csv > res_grep_?.txt

if [ -s res_grep_?.txt ] # check that res_grep?.txt is not empty
then
outfile=sequence_known/sequence_known_?.faa
echo $line >> $outfile
else
outfile=sequence_unknown/sequence_unknown_?.faa
echo $line >> $outfile
fi

else
echo $line >> $outfile

fi

done < data?.faa # file to analyze

rm -f temporary_file_?.txt
rm -f res_grep_?.txt

date

