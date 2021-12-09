library(dplyr)
library(tidyverse)

music_data <- read.csv("top50.csv")


#make a new table that summarizes the top genres, the number of songs in each genre, and their average danceability and energy. 
summary_table_3 <- music_data %>% 
rename(Artist = Artist.Name) %>% 
group_by(Artist) %>% 
summarise(average_danceability = round(mean(Danceability), digits = 0),
           average_popularity = round(mean(Popularity), digits = 0)) %>% 
arrange(-average_danceability, -average_popularity)

chart_popularity_vs_danceability <- ggplot(data = music_data, mapping = aes(x = Popularity, y = Danceability)) + geom_point() + geom_line() + theme(axis.text = element_text(angle = 90, vjust = 0.5, hjust = 1)) + ggtitle("Danceability vs Popularity")

