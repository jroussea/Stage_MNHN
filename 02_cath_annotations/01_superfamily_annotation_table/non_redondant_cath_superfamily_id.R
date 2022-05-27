# loading packages
library(tidyverse)
library(readr)

# data path
setwd("/home/rousseau/Stage_MNHN/02_cath_annotations/")

# loadig dataset
table_hmm_profiles <- read_csv("hmm_profiles.crh.csv")

# Column 2 contain informations of CATH superfamilies (cath-superfamily)
# non-redundant cath superfamily identifier
CATH_ID <- table_hmm_profiles %>% 
  select("cath-superfamily") %>% 
  arrange() %>% 
  distinct(.keep_all = T)

# export identifiers in csv format
write.table(CATH_ID, "non_redondant_cath_superfamily_id.csv", sep = ",", row.names=FALSE)
