#!/bin/bash

# data path
cd /scratchbeta/rousseau/Tara_Ocean

# count the number of .faa files
#to create the same number of hmmer.sh script (1 per .faa file)
NbFile=`ls data*.faa | wc -l`

# path home
cd /home/rousseau

mkdir hmmer_scripts

for (( i=1; i<=$NbFile; i++ ))
do

cp ./hmmer.sh hmmer_scripts/hmmer_$i.sh

# replaces the "?" by the number of the corresponding .faa file
sed -i -e "s/\?/$i/g" hmmer_scripts/hmmer_$i.sh

done

# scripts path
cd /home/rousseau/hmmer_scripts

# execute all hmmer_$i.sh scripts
for (( i=1; i<=$NbFile; i++ ))
do

qsub HMMER_$i.sh

done

