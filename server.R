# server.R

library(quantmod)
source("helpers.R")

shinyServer(function(input, output) {

  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)    
  })
  
  data <- reactive({
    ifelse(input$adjust, return(adjust(dataInput())), return(dataInput())) 
  })
    
  output$plot <- renderPlot({
    chartSeries(data(), theme = chartTheme("white"), 
      type = "line", log.scale = input$log, TA = NULL)
  })
  
})