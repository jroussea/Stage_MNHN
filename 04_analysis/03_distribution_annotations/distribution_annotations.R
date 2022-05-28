# loading packages
library(tidyverse)

# loading dataset
mags_annotation_taxonomy <- read.table("mags_annotation_taxonomy.csv", sep = ",", header = T)

# delete all MAGs without annotation
mags_annotation_taxonomy <- subset(mags_annotation_taxonomy, number_annotation != 0)

# sort in ascending order the kingdom
mags_annotation_taxonomy$taxonomy_kingdom <- fct_infreq(mags_annotation_taxonomy$taxonomy_kingdom)

# graph of the distribution of annotations according to the kingdom
mags_annotation_taxonomy %>% 
  ggplot(aes(x = taxonomy_kingdom, fill = taxonomy_kingdom)) +
  geom_bar(show.legend = FALSE) +
  scale_y_continuous(breaks = seq(0, 300, 50)) +
  labs(title = "Distribution of annotations according to kingdom",
       x = "Taxonomy - kingdom",
       y = "Number of annotations") +
  theme_light() +
  theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
        axis.title = element_text(size = 22),
        axis.text = element_text(size = 12)) 

# saving the second distribution graph
ggsave("results/distribution_annotations_kingdom.png", width = 26, height = 18)

# sort in ascending order the phylum
mags_annotation_taxonomy$taxonomy_phylum <- fct_infreq(mags_annotation_taxonomy$taxonomy_phylum)

# graph of the distribution of annotations according to the kingdom
mags_annotation_taxonomy %>% 
  ggplot(aes(x = taxonomy_phylum, fill = taxonomy_kingdom)) +
  geom_bar() +
  scale_y_continuous(breaks = seq(0, 300, 50)) +
  labs(title = "Distribution of annotations according to phylum",
       x = "Taxonomy - phylum",
       y = "Number of annotations") +
  scale_fill_discrete(name = "Legends:") +
  theme_light() +
  theme(plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
        legend.title = element_text(size = 22),
        legend.text = element_text(size = 12),
        axis.title = element_text(size = 22),
        axis.text = element_text(size = 12),
        axis.text.x = element_text(angle = 45, hjust = 1)) 

# saving the second distribution graph
ggsave("results/distribution_annotations_phylum.png", width = 26, height = 18)