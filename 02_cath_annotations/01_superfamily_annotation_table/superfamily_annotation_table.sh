#!/bin/bash

#PBS -q beta
#PBS -l select=1:ncpus=24
#PBS -l walltime=60:00:00
#PBS -N table_superfamily_annotation

cd /scratchbeta/rousseau/annotation

mkdir Name_Superfamily
mkdir Data_Superfamily

mkdir ID_cath
mkdir ID_uniprot

mkdir annot_by_ID

pathName="Name_Superfamily"
pathData="Data_Superfamily"

pathCath="ID_cath"
pathUniprot="ID_uniprot"

pathAnnot="annot_by_ID"

echo -e "superfamily_ID\tsuperfamily_name\tsuperfamily_description\tCATH_ID\tUniprot_ID" > superfamily_annotation_table.csv

count=0

while read line
do

cd /scratchbeta/rousseau/annotation

let count++

grep -P "$line\t" CATHdb4_3_0.sql > $pathName/name$count.csv
grep "$line-" CATHdb4_3_0.sql > $pathData/data$count.csv

info=`cut -f 4,5 $pathData/data$count.csv`
echo "$info" > $pathData/data$count.csv

info=`cut -f 2,4,5 $pathName/name$count.csv`
echo "$info" > $pathName/name$count.csv

grep "cath" $pathData/data$count.csv
grep "cath" $pathData/data$count.csv > cath.csv
grep "uniprot" $pathData/data$count.csv
grep "uniprot" $pathData/data$count.csv > uniprot.csv

InfoCath=`cut -f 1 cath.csv`
InfoUniprot=`cut -f 1 uniprot.csv`

echo "$InfoCath" > cath.csv
echo "$InfoUniprot" > uniprot.csv

tr "\n" "|" < cath.csv > $pathCath/cath$count.csv
tr "\n" "|" < uniprot.csv > $pathUniprot/uniprot$count.csv

paste $pathName/name$count.csv $pathCath/cath$count.csv $pathUniprot/uniprot$count.csv > $pathAnnot/annot$count.csv

cat $pathAnnot/annot$count.csv >> table_superfamily_annotation.csv

rm -f $pathName/name$count.csv
rm -f $pathData/data$count.csv
rm -f $pathCath/cath$count.csv
rm -f $pathUniprot/uniprot$count.csv
rm -f $pathAnnot/annot$count.csv

done < CATH_ID.txt

rm -rf $pathName
rm -rf $pathData
rm -rf $pathCath
rm -rf $pathUniprot
rm -rf $pathAnnot

