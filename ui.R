library(shiny)

shinyUI(fluidPage(
  titlePanel("Stocks Visualizer"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock to examine. 
        Information will be collected from yahoo finance."),
    
      textInput("symb", "Symbol", "SPY"),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2013-01-01", 
        end = as.character(Sys.Date())),
      
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
        value = FALSE),
      
      checkboxInput("adjust", 
        "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(
        tabsetPanel(
          tabPanel("Plot", plotOutput("plot")),
          tabPanel("Help"
                   , "The \"Stock Visualizer\" application looks up stock prices by ticker 
                   symbol and displays the result as a line chart."
                   ,tags$br()
                   ,"We require you to enter the ticker to be analyzed in the \"Symbol\" textbox and a date range 
                     in the calendar boxes for \"Date Range\"."
                   , tags$br()
                   , "Choose whether to plot stock prices or the log of the stock prices on the y axis, and 
                      Decide whether or not to correct prices for inflation with the two checkboxes.")  
        )
    )
  )
))