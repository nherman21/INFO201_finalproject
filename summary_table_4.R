library(tidyverse)
library(dplyr)

music_data <- read.csv("top50.csv")

summary_table_4 <- music_data %>%
  rename(top_genre = Genre) %>% 
  group_by(top_genre) %>% 
  summarise(average_length = round(mean(Length.), digits = 0),
            (average_beats_per_minute = round(mean(Beats.Per.Minute), digits = 0))
            )

names(summary_table_4)[3] <- "average_beats_per_minute"