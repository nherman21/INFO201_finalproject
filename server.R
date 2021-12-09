library(shiny)
library(dplyr)
library(fmsb)
library(plotly)
library(ggplot2)

server <- function(input, output) {
  #server for page 1
  radar_table <- function(genre){
    
    rd_df <- select(summary_table_2, -c(top_genre))
    max_df <- summarise_all(rd_df, max)
    min_df <- summarise_all(rd_df, min)
    
    input_df <- filter(summary_table_2, top_genre == genre)
    input_df <- select(input_df, -c(top_genre))
    
    final_df <- do.call("rbind", list(max_df, min_df, input_df))
    return(final_df)
  }
  
  output$table <- renderTable({
    filter(summary_table_2, top_genre == input$genre)
  })
  
  output$radar <- renderPlot({
    radarchart(radar_table(input$genre))
  })
  
  #page 2
  output$danceability <- renderPlot({
    pg2_plot <- filter(summary_table_3, top_genre == input$genre_1)
    ggplot(summary_table_3) + geom_point(aes(x=average_danceability, y=average_popularity)) + geom_point(aes(x=pg2_plot$average_danceability
                                                                                                             , y=pg2_plot$average_popularity), col="blue")
  })
  
  
  
  #page 3
  # radar_table <- function(genre){
  #   rd_df <- select(summary_table_4, -c(top_genre))
  # }
  
  output$line <- renderPlot({
    pg3_plot <- filter(summary_table_4, top_genre == input$genre_1)
    ggplot(summary_table_4) + geom_point(aes(x=average_length, y=average_beats_per_minute)) + geom_point(aes(x=pg3_plot$average_length
                                                                                                             , y=pg3_plot$average_beats_per_minute), col="red")
    
  })}
  # output$table <- renderTable({
  
  # })