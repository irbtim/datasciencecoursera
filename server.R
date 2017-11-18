library(shiny)

library(datasets)

library(ggplot2)

library(splines)
setwd("C:/Users/Aknur/Desktop/Data developing products")
flatprice<- read.csv("flats_moscow.txt", sep="\t", header=TRUE, dec=".")



shinyServer(function(input,output){
  
  dataset <- reactive({
    
    flatprice[sample(nrow(flatprice), input$sampleSize),]
    
  })
  
  
  
  output$flatpricePlot <- renderPlot({
    
    myTitle <- "How does flat price change?"
    
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$jitter)
      p <- p + geom_jitter()
    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    
    
  }, height=700)
    
  })
  
  
  