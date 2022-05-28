#!/bin/bash

cut -d "," -f 1 redundant_MAGs_statistics.csv > mags_name.txt

sed 1d mags_name.txt -i

echo "mags_name,number_annotation" > pourcentage_annotation.csv

while read line
do

var=`grep $line hmm_profiles.crh.csv | wc -l`

echo $line","$var >> pourcentage_annotation.csv

done < mags_name.txt

cut -d "," -f 4,5 redundant_MAGs_statistics.csv > recup_taxonomy.csv

sed 1d recup_taxonomy.csv -i

echo "taxonomy_kingdom,taxonomy_phylum" > colnames.csv

cat colnames.csv recup_taxonomy.csv > taxonomy.csv

paste -d "," pourcentage_annotation.csv taxonomy.csv > results/mags_annotation_taxonomy.csv

rm -f mags_name.txt
rm -f pourcentage_annotation.csv
rm -f recup_taxonomy.csv
rm -f colnames.csv
rm -f taxonomy.csv
