# loading packages
library(tidyverse)
library(scales)

# data path
setwd("/home/rousseau/Stage_MNHN/04_analysis/02_sequence_length/results/")

# loading dataset
sequence_length_dataset <- read.table("sequence_length_dataset.csv", sep = ",", header = T)

# shaping the dataset for analysis
sequence_length_dataset <- sequence_length_dataset %>% 
  pivot_longer(cols = c(sequence_length_unknown, sequence_length_known),
               names_to = "sequence_type",
               values_to = "sequence_length") %>% 
  filter(!is.na(sequence_length))

# graph of the distribution of sequences as a function of size
sequence_length_dataset %>% 
  ggplot(aes(x = sequence_length, color = sequence_type, fill = sequence_type)) +
  geom_histogram(position = "identity", bins = 80, alpha = 0.3) +
  guides(color = FALSE) +
  scale_x_continuous(breaks = seq(0, 25000, 400)) +
  scale_y_continuous(labels = comma, breaks = seq(0, 3000000, 500000)) +
  labs(title = "Distribution of sequences as a function of size",
       y = "Number of protein sequences",
       x = "Protein length") +
  scale_fill_discrete(name = "Legends:",
                      labels = c("annotated sequences",
                                 "unannotated sequences")) +
  theme_light() +
  theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
        legend.title = element_text(size = 22),
        legend.text = element_text(size = 12),
        axis.title = element_text(size = 22),
        axis.text = element_text(size = 12, angle = 45, hjust = 1)) 


# saving the first distribution graph
ggsave("sequence_length_distribution_1.png", width = 26, height = 18)

# remove proteins with a size greater than 3000 amino acides
sequence_length_dataset_filter <- sequence_length_dataset[-which(sequence_length_dataset$sequence_length>=3000),]

# graph of the distribution of sequences as a function of size
sequence_length_dataset_filter %>% 
  ggplot(aes(x = sequence_length, color = sequence_type, fill = sequence_type)) +
  geom_histogram(position = "identity", bins = 110, alpha = 0.3) +
  guides(color = FALSE) +
  scale_x_continuous(breaks = seq(0, 3000, 50)) +
  scale_y_continuous(labels = comma, breaks = seq(0, 1200000, 200000)) +
  labs(title = "Dtribution of sequences as a function of size",
       subtitle = "proteins with a size greater than 3000 amino acids have been removed",
       y = "Number of protein sequences",
       x = "Protein length") +
  scale_fill_discrete(name = "Legends:",
                      labels = c("annotated sequences",
                                 "unannotated sequences")) +
  theme_light() +
  theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
        plot.subtitle = element_text(size = 15),
        legend.title = element_text(size = 22),
        legend.text = element_text(size = 12),
        axis.title = element_text(size = 22),
        axis.text = element_text(size = 12, angle = 45, hjust = 1)) 

# saving the second distribution graph
ggsave("sequence_length_distribution_2.png", width = 26, height = 18)

