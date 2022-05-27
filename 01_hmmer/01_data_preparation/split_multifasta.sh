#!/bin/bash

#PBS -q beta
#PBS -l select=5:ncpus=24:mpiprocs=24
#PBS -l walltime=24:00:00
#PBS -N split_multifasta_V2

# data path
cd /scratchbeta/rousseau/Tara_Ocean

touch data1.faa

count=0
NbData=1

# separation of the .faa file into several .faa files containing a maximum of 100,000 sequences
while read line
do

if [[ ${line:0:1} == '>' ]]
then

if [ $count -ge 100000 ]
then
count=0
let "NbData++" 
fi

let "count++"
echo $line >> data$NbData.faa

else
echo $line >> data$NbData.faa

fi

done < SMAGs.faa # files containing protein sequences
