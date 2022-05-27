#!/bin/bash

#PBS -q beta
#PBS -l select=1:ncpus=24
#PBS -l walltime=60:00:00
#PBS -N csv_file_concatenation

# data path
cd /scratchbeta/rousseau/Tara_Ocean

NbFile=`ls data*.faa | wc -l`

for ( i=1; i<=$NbFile; i++ ))
do

# remove header from all data$i.crh.csv files
sed 1d data$i.crh.csv -i

done

# final csv file header
echo "#domain_id,cath-superfamily,query-id,match-id,score,boundaries,resolved,aligned-regions,cond-evalue,indp-evalue" > hmm_profiles.crh.csv

# concatenation of all data$i.crh.csv files in hmm_profiles.crh.csv file
cat data*.csv >> hmm_profiles.crh.csv

