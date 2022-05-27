library(tidyverse)

data_seq_len <- read.table("data_seq_len.csv", sep = ",", header = T)
colnames(data_seq_len)

data_seq_len <- data_seq_len %>% 
  pivot_longer(cols = c(seq_len_unknown, seq_len_known),
               names_to = "sequence_type",
               values_to = "seq_len") %>% 
  filter(!is.na(seq_len))
tail(sort(data_seq_len$seq_len), 10)
     
data_seq_len %>% 
  ggplot(aes(x = seq_len, color = sequence_type, fill = sequence_type)) +
  geom_histogram(position = "identity", bins = 80, alpha = 0.3) +
  guides(color = FALSE) +
  labs(title = "Distribution de la densité en protéines en fonction de leur longueur",
       y = "Number of protein sequences",
       x = "Protein length") +
  scale_fill_discrete(name = "Legends:",
                      labels = c("sequences known",
                                 "sequence unknown")) +
  scale_x_continuous(breaks = seq(0, 25000, 200)) +
  theme_light() +
  theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
        legend.title = element_text(size = 22),
        legend.text = element_text(size = 12),
        axis.title = element_text(size = 22),
        axis.text = element_text(size = 12, angle = 45, hjust = 1)) 


  data_seq_len %>% 
    ggplot(aes(x = seq_len, color = sequence_type, fill = sequence_type)) +
    geom_histogram(aes(y = stat(density)), position = "identity", bins = 80, alpha = 0.3) +
    geom_density(alpha = 0) +
    guides(color = "none") +
    labs(title = "Distribution de la densité en protéines en fonction de leur longueur",
         y = "Protein sequence density",
         x = "Protein length") +
    scale_fill_discrete(name = "Legends:",
                        labels = c("sequences known",
                                   "sequence unknown")) +
    theme_light() +
    theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
          legend.title = element_text(size = 22),
          legend.text = element_text(size = 12),
          axis.title = element_text(size = 22),
          axis.text = element_text(size = 12))
  