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
    radar_table(input$genre)
  })
  
  output$radar <- renderPlot({
    radarchart(radar_table(input$genre))
  })
  
  
  
  
}

