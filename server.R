#server for page 1


server <- function(input, output) {
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
  
}



#server for page 2

server <- function(input, output) {
  radar_2_table <- function(danceability){
    
    rd_2_df <- select(Summary_Table_3, -c(top_danceability))
    max_2_df <- summarise_all(rd_2_df, max)
    min_2_df <- summarise_all(rd_2_df, min)
    
    input_2_df <- filter(Summary_Table_3, top_danceability == danceability)
    input_2_df <- select(input_2_df, -c(top_danceability))
    
    final_2_df <- do.call("rbind", list(max_2_df, min_2_df, input_df))
    return(final_2_df)
  }
  
  output$table_2 <- renderTable({
    radar_2_table(input$danceability)
  })
  
  output$chart_2 <- renderChart({
    chart_popularity_vs_danceability})
  
}







#server for page 3

server <- function(input, output){
  radar_table <- function(genre){
    rd_df <- select(summary_table_4, -c(top_genre))
  }
  output$line <- renderPlot({
    plot(summary_table_4$average_length, summary_table_4$average_beats_per_minute)
  })
  output$table <- renderTable({
    filter(summary_table_4, top_genre == input$genre)
  })
}











