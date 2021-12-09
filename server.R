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

#server for page 2
  radar_2_table <- function(danceability){
  
    rd_2_df <- select(Summary_Table_3, -c(Artist))
    max_2_df <- summarise_all(rd_2_df, max)
    min_2_df <- summarise_all(rd_2_df, min)
    
    input_2_df <- filter(Summary_Table_3, Artist == Artist.Name)
    input_2_df <- select(input_2_df, -c(Artist))
    
    final_2_df <- do.call("rbind", list(max_2_df, min_2_df, input_df))
    return(final_2_df)
  }
  
  output$table <- renderTable({
    radar_table(input$genre)
  })
  
  output$radar <- renderPlot({
    radarchart(radar_table(input$genre))
  })
  
  output$table_2 <- renderTable({
    radar_2_table(input$danceability)
  })
  
  output$chart_2 <- renderPlot({
    chart_popularity_vs_danceability(radar_2_table(input$danceability))
  })}



