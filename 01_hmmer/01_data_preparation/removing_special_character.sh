#!/bin/bash

#PBS -q beta
#PBS -l select=5:ncpus=24:mpiprocs=24
#PBS -l walltime=24:00:00
#PBS -N removing_special_character.sh

# data path
cd /scratchbeta/rousseau/Tara_Ocean

# remove special characters
sed 's/\*//g' SMAGs_v1_concat.faa > SMAGs.faa
