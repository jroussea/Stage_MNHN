#!/bin/bash

# data_path
cd /scratchbeta/rousseau/Tara_Ocean

# count the number of .faa files
# to create the same number of check_sequences.sh script (1 per .faa file)
NbFile=`ls data*.faa | wc -l`

# path home
cd /home/rousseau

mkdir check_scripts

for (( i=1; i<=$NbFile; i++ ))
do

cp ./check_sequences.sh check_scripts/check_sequences_$i.sh

# replaces the "?" by the number of the corresponding .faa file
sed -i -e "s/\?/$i/g" check_scripts/check_sequences_$i.sh

done

# scripts path
cd /home/rousseau/check_scripts

# execute all hmmer_$i.sh scripts
for (( i=1; i<=$NbFile; i++ ))
do

qsub check_sequences_$i.sh

done
