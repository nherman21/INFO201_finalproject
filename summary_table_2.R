library(dplyr)
music_data <- read.csv("top50.csv")


#make a new table that summarizes the top genres, the number of songs in each genre, and their average danceability and energy. 
summary_table_2 <- music_data %>% 
  rename(top_genre = Genre) %>% 
  group_by(top_genre) %>% 
  summarise( average_danceability = round(mean(Danceability), digits = 0),
            average_energy = round(mean(Energy), digits = 0),
            average_liveness = round(mean(Liveness), digits = 0),
            average_loudness = round(mean(Loudness..dB..), digits = 0),
            average_valence = round(mean(Valence.), digits = 0)) %>% 
  arrange(-average_danceability, -average_energy, -average_liveness, -average_loudness, -average_valence)

