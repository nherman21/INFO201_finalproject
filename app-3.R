
#12/01/21 how to use plotly instead of ggplot to plot more accurately


library(shiny)
library(dplyr)
library(fmsb) #this package deals with radar charts
library(plotly)

ui <- fluidpage(
  plotlyOutput("myscatter"),
  actionButton("modalShow", "Open a Modal Window")
)



server <- function(input, output){
  output$myscatter <- renderPlotly({
    plot_ly(mtcars, x = ~wr, y = ~mpg, text = ~paste("weight", "wt: ", "mpg: ", "mpg"))
  })
  
  observeEvent(input$modalShow, {
    showModal(modalDialog(
      title = "Here is my Modal Window",
      "here is the body, put stuff here",
      "here is the next line",
      h3("blah"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
}


shinyApp(ui = ui, server = server)
