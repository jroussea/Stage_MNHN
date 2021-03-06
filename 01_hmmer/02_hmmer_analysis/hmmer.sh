#!/bin/bash

#PBS -q beta
#PBS -l select=1:ncpus=1
#PBS -l walltime=24:00:00
#PBS -N HMMER_71

module load hmmer/3.3.2

cd /scratchbeta/rousseau

######################################
######### HMMER / hmmsearch ##########
######################################


date

echo -e "\nStart analysis with HMMER\n"

echo "Start HMMER"

# run hmmsearch on sequence file, change parameters as appropriate
hmmsearch -Z 10000000 --domE 0.001 --incdomE 0.001 -o Tara_Ocean/data?.hmmsearch gene3d_hmmsearch/hmms/main.hmm Tara_Ocean/data?.faa

echo "Start cath-resolved_hit"

# resolve any conflicting (overlapping) domain assignments, versions for different platforms (mac/linux) are available online along with documentation:
# http://cath-tools.readthedocs.io/en/latest/tools/cath-resolve-hits/
# we recommend using a worst-permissible-bitscore of 25 and applying --min-dc-hmm-coverage=80 (only available for processing hmmsearch output) 
./gene3d_hmmsearch/cath-resolve-hits --min-dc-hmm-coverage=80 --worst-permissible-bitscore 25 --output-hmmer-aln --input-format hmmsearch_out Tara_Ocean/data?.hmmsearch > Tara_Ocean/data?.crh

echo "Start assign-cath-superfamily"

# assign CATH superfamilies to the output file generated by cath-resolve-hits
python ./gene3d_hmmsearch/assign_cath_superfamilies.py Tara_Ocean/data?.crh

echo -e "\nEnd analysis with HMMER\n"

date


