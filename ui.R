library(shiny)
library(dplyr)
library(fmsb)
library(plotly)

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
  img(src = "https://lineup-images.scdn.co/your-top-songs-2019_LARGE-en.jpg", height = 300, width = 300),
  # Note the wrapping of the string in HTML()
  tags$style(HTML("
     @import url('https://fonts.googleapis.com/css2?family=Dosis:wght@300;700&family=Poppins:ital,wght@0,300;1,300&family=Quicksand&display=swap');
      body {
        background-color: #C6E2C6;
        color: #444444;
        text-align:center; 
      }
      h2 {
        font-family: 'Quicksand', sans-serif;
      }
      .shiny-input-container {
        color: #474747;
      }")),
  
)


#UI page 1   
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

#UI Page 2
page2_view <- tabPanel(
  "Page 2",
  titlePanel("Popularity vs. Danceability"),
  p("We are going to analyze the relationship between 
    danceability vs popularity to see if there is positive correlation"),
  sidebarPanel(selectInput(
    inputId = "danceability",
    label = "Select a genre: ",
    choices = summary_table_3$top_genre
    
  )),
  tags$style(HTML("
     @import url('https://fonts.googleapis.com/css2?family=Dosis:wght@300;700&family=Poppins:ital,wght@0,300;1,300&family=Quicksand&display=swap');
      body {
        background-color: #C6E2C6;
        color: #444444;
        text-align:center; 
      }
      p{
        font-family: 'Quicksand', sans-serif;
      }
      .shiny-input-container {
        color: #474747;
      }")),
  mainPanel(
    plotOutput("danceability")
  ))

#UI Page 3
page3_view <- tabPanel(
  "Page 3",
  titlePanel("Top Genre vs. Their Average Song Length & Average B.P.M."),
  p("In this page, we are going to look at a scatterplot that shows us a top genre, following
    with its average song length and beats per minute. When you select a genre, the red dot on the 
    chart will be the genre of choice, representing 
    its average song length and average beats per minute."),
  sidebarPanel(selectInput(
    inputId = "genre_1",
    label = "Select a Genre (the selected genre will be a red point on the graph): ",
    choices = summary_table_4$top_genre
    
    
  )),
  tags$style(HTML("
     @import url('https://fonts.googleapis.com/css2?family=Dosis:wght@300;700&family=Poppins:ital,wght@0,300;1,300&family=Quicksand&display=swap');
      body {
        background-color: #C6E2C6;
        color: #444444;
        text-align:center; 
      }
      p{
        font-family: 'Quicksand', sans-serif;
      }
      .shiny-input-container {
        color: #474747;
      }")),
  mainPanel(
    plotOutput("line")
  ))


#Summary Page
summary_view <- tabPanel(
  "Summary",
  titlePanel("MAIN TAKEAWAYS"),
  p("Spotify is one of the most popular music streaming platforms in the whole world. It has around 200 million premium subscribers. We were very excited to work on this dataset because we have personally streamed most of these songs and are huge fans of it ourselves. We believe the audience will find our analysis to be very useful because of its relevance in pop culture. We can see that there is a direct proportion between the average danceabilty and popularity which implies that upbeat and funky songs are popular. Most songs that have made an appearance in the dataset belong to the genre of dance pop. It has a pretty high danceability and loudness. It is not surprising that dance pop should be the most popular of them all. The average danceabilty is very high for dance pop and understandably so and the average Loudness is around 6 which is pretty high. Alternate hip hop, Australian hip hop, big room and boy band are the least popular genres in the top 50 for the year 2019.  

We were right to assume that the energy levels of a song influence its popularity. It is seen that most songs in the dataset come under the energy levels of 76-82. We believe that music is a way to relieve your stress and the energy levels definitely contribute to making a song more dance-worthy. We may be mistaken that the fast tempo of the song contributes to its position on the chart but it is not the case as it is dominated by by a lot of songs in the 95-106 range. Around 35 of the 50 songs are in the danceability range 65-90 which reiterates the claim that dance pop dominates the chart.


Finally as much as a song is good the personal popularity of an artist also matters because even if your song is really good, if you do not have a lot of fans you may not get as many streams on Spotify. It is clear that the most popular artist in the dataset is Ed Sheeran who is known for his string of no. 1’s on the Billboard Hot 100 songs that he has released over the years. Other artists on the list are lesser known to the audience like Nicky Jam and Rosalia. We think that it is safe to conclude that the world likes listening to dance music the most and we personally enjoy it too. 

  "),
  img(src = "https://storage.googleapis.com/pr-newsroom-wp/1/2020/03/Header.png", height = 200, width = 500),
  tags$style(HTML("
     @import url('https://fonts.googleapis.com/css2?family=Dosis:wght@300;700&family=Poppins:ital,wght@0,300;1,300&family=Quicksand&display=swap');

    body {
      background-color: #C6E2C6;
        color: #444444;
        text-align:center; 
    }
    h2 {
      font-family: 'Quicksand', sans-serif;
    }
    .shiny-input-container {
      color: #474747;
    }")),
  
)







ui <- navbarPage(
  "Spotify's Top Songs",
  introduction_view,
  page1_view,
  page2_view,
  page3_view,
  summary_view
)