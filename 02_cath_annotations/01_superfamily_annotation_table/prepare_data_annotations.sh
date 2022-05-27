#!/bin/bash

#PBS -q beta
#PBS -l select=1:ncpus=24
#PBS -l walltime=60:00:00
#PBS -N prepare_data_annotation

cd /scratchbeta/rousseau/annotation

date

# override the header of the non_redondant_cat_superfamily_id.csv file
sed 1d non_redondant_cath_superfamily_id.csv -i

while read line
do

# remove special characters (") from the beginning and end of each line
echo $line | sed 's/\"//' | sed 's/\"//' >> non_redondant_cath_superfamily_id.txt

done < non_redondant_cath_superfamily_id.csv

# retrieve only version 4.3.0 of the CATH database
grep v4_3_0 funvardb-1.0.sql > CATHdb4_3_0.sql

date
