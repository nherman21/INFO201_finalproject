
library(shiny)
library(dplyr)
library(fmsb)
library(plotly)


ui <- fluidPage(
  #using HTML to style 
  tags$style(HTML("
     @import url('https://fonts.googleapis.com/css2?family=Dosis:wght@300;700&family=Poppins:ital,wght@0,300;1,300&family=Quicksand&display=swap');
      body {
      font-family: 'Quicksand', sans-serif;
        background-color: white;
        text-color: #1DB954;
        text-align:center; 
      }
      h2 {
        font-family: 'Quicksand', sans-serif;
      }
      .shiny-input-container {
        color: #474747;
      }")),
  #Introduction Page
  introduction_view <- tabPanel(
    "Introduction",
    titlePanel("SPOTIFY'S TOP 50 SONGS IN 2019"),
    p("This project explores Spotify’s top 50 songs from 2019. 
  As the year is wrapping up, Spotify does an annual wrap up of songs every year for users.
  Our main goal is to explore which variables from the top songs make them popular. 
  The data that we have used for this project originates from Kaggle. The dataset 
  contains the track name, artist name, genre, and song elements such as beats per minute, energy, 
  danceability, loudness, liveness, valence, length, acousticness, speechiless, and popularity. 
  To learn more about the details of the data, please visit: 
http://organizeyourmusic.playlistmachinery.com/
Overall in this project, we analyzed how each song elements affected how popular the songs were."),
    img(src = "https://i2-prod.bristolpost.co.uk/incoming/article4124115.ece/ALTERNATES/s615/0_Spotify-fundraising.jpg", height = 300, width = 400),
    img(src = "https://lineup-images.scdn.co/your-top-songs-2019_LARGE-en.jpg", height = 300, width = 300)
  ),
  
  
  #page 1   
  page1_view <- tabPanel(
    "Page 1",
    titlePanel("Analyzing Top Genres"),
    p("We are going to explore the top genres in this page. 
    We want to find out the average song elements
    in each top genres; the radar chart with 
    the following average music elements displayed
    will allow us to see which elements
    makes the genres popular.
      "),
    
    sidebarPanel(selectInput(
      inputId = "genre",
      label = "Select a Genre: ",
      choices = summary_table_2$top_genre
    )),
    mainPanel(
      tableOutput("table"),
      plotOutput("radar")
    )
    
  )
  
)

ui <- navbarPage(
  "Spotify's Top Songs",
  introduction_view,
  page1_view
  
)



