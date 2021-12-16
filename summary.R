library(shiny)

server<-function(input,output){}

ui <- fluidPage(
    #Summary Page
    summary_view <- tabPanel(
        "Summary",
        titlePanel("MAIN TAKEAWAYS"),
        p("Spotify is one of the most popular music streaming platforms in the whole world. It has around 200 million premium subscribers. We were very excited to work on this dataset because we have personally streamed most of these songs and are huge fans of it ourselves. We believe the audience will find our analysis to be very useful because of its relevance in pop culture. We can see that there is a direct proportion between the average danceabilty and popularity which implies that upbeat and funky songs are popular. Most songs that have made an appearance in the dataset belong to the genre of dance pop. It has a pretty high danceability and loudness. It is not surprising that dance pop should be the most popular of them all. The average danceabilty is very high for dance pop and understandably so and the average Loudness is around 6 which is pretty high. Alternate hip hop, Australian hip hop, big room and boy band are the least popular genres in the top 50 for the year 2019.  
      
                We were right to assume that the energy levels of a song influence its popularity. It is seen that most songs in the dataset come under the energy levels of 76-82. We believe that music is a way to relieve your stress and the energy levels definitely contribute to making a song more dance-worthy. We may be mistaken that the fast tempo of the song contributes to its position on the chart but it is not the case as it is dominated by by a lot of songs in the 95-106 range. Around 35 of the 50 songs are in the danceability range 65-90 which reiterates the claim that dance pop dominates the chart.
                
                
                Finally as much as a song is good the personal popularity of an artist also matters because even if your song is really good, if you do not have a lot of fans you may not get as many streams on Spotify. It is clear that the most popular artist in the dataset is Ed Sheeran who is known for his string of no. 1???s on the Billboard Hot 100 songs that he has released over the years. Other artists on the list are lesser known to the audience like Nicky Jam and Rosalia. We think that it is safe to conclude that the world likes listening to dance music the most and we personally enjoy it too. 
                
                "),
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
                              }")))
    
)
ui <- navbarPage(
    
    summary_view
    
)

shinyApp(ui = ui, server = server)
