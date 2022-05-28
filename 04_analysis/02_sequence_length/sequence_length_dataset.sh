#!/bin/bash

# create a single csv file with annotated and unannotated sequence length
paste -d "," sequence_length_unknown.txt sequence_length_known.txt > sequence_length_dataset.csv
