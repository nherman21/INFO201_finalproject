# A function that takes in a dataset and returns a list of info about it:
library(dplyr)
library(tidyverse)

music_data <- read_csv("Desktop/INFO201/github-demo-anuujini/INFO201_finalproject/top50.csv")
summary_info <- list()
summary_info$num_observations <- nrow(music_data)
summary_info$energy_max_value <- music_data %>%
  filter(Energy == max(Energy, na.rm = T)) %>%
  select(Energy)
summary_info$energy_min_value <- music_data %>%
  filter(Energy == min(Energy, na.rm = T)) %>%
  select(Energy)
summary_info$dance_avg_value <- music_data %>%
  summarise(mean(Danceability,trim = 0, na.rm = T ))
summary_info$num_features <- ncol(music_data)
  
 

