library(here)
library(tidyverse)

rm(list=ls())
source("stat_chull.R")

data(dune)
data(dune.env)
dune.pca <- rda(dune)

dune.sco <- data.frame(scores(dune.pca, display="sites"), Use=as.factor(dune.env$Use))

ggplot(dune.sco, aes(x=PC1, y=PC2, fill=Use)) +
  geom_point() +
  stat_chull(alpha=0.5) + 
  theme_classic()
