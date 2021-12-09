library(dplyr)
library(tidyverse)

music_data <- read.csv("top50.csv")


#make a new table that summarizes the top genres, the number of songs in each genre, and their average danceability and popularity. 
summary_table_3 <- music_data %>% 
  rename(top_genre = Genre) %>% 
  group_by(top_genre) %>% 
  summarise(average_danceability = round(mean(Danceability), digits = 0),
             average_popularity = round(mean(Popularity), digits = 0)) %>% 
  arrange(-average_danceability, -average_popularity)
