# loading packages
library(readr)

# data path
setwd("/home/rousseau/Stage_MNHN/04_analysis/01_proportion_known_unknown/results/")

# loading the dataset containing the names of the known sequences
sequence_known <- read_csv("sequence_name_known.csv", col_names = FALSE)
# number of lines in the file (1 line = 1 sequence)
nb_lines_sequence_known <- nrow(sequence_known)

# loading the dataset containing the names of the unknown sequences
sequence_unknown <- read_csv("sequence_name_unknown.csv", col_names = FALSE)
# number of lines in the file (1 line = 1 sequence)
nb_lines_sequence_unknown <- nrow(sequence_unknown)

# total number of sequences in the starting file
nb_lines_total <- nb_lines_sequence_known + nb_lines_sequence_unknown

# calculates the proportion of known and unknown sequences
proportion_known <- nb_lines_sequence_known * 100 / nb_lines_total 
proportion_unknown <- nb_lines_sequence_unknown * 100 / nb_lines_total

print(paste("The proportion of known sequences in this dataset is", round(proportion_known, digits = 2), "%"))
print(paste("The prportion of unknwon sequences in this dataset is", round(proportion_unknown, digits = 2), "%"))

# save values in a csv file
proportion <- data.frame(proportion_known, proportion_unknown)
write.table(proportion, "proportion_known_unknwon.csv", sep = ",", row.names=FALSE)
