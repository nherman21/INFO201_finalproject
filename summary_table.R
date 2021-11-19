library(dplyr)
music_data <- top50


#make a new table that summarizes the top genres, the number of songs in each genre, and their average danceability and energy. 
  rename(top_genre = Genre) %>% 
  group_by(top_genre) %>% 
  summarise(num_of_songs = n(), average_danceability = round(mean(Danceability), digits = 0),
            average_energy = round(mean(Energy), digits = 0)) %>% 
  arrange(-num_of_songs, -average_danceability, -average_energy)
            
  