library(shiny)

library(datasets)

library(ggplot2)
setwd("C:/Users/Aknur/Desktop/Data developing products")
flatprice<- read.csv("flats_moscow.txt", sep="\t", header=TRUE, dec=".")

shinyUI(fluidPage(
  
  titlePanel("Flat price in Moscow"),
  
  sidebarLayout(
    
    sidebarPanel (
      
      helpText("Provide the size of the flat price  dataset"),
      
      sliderInput('sampleSize', 'Sample Size', min = 1, max = nrow(flatprice),
                  
                  value = 1000, step = 1000, round = 0),
      selectInput('x', 'X', names(flatprice)),
      selectInput('y', 'Y', names(flatprice), names(flatprice)[[2]]),
      
      checkboxInput('jitter', 'Jitter'),
      checkboxInput('smooth', 'Smooth')

      
    ),
    
    mainPanel(
      
      plotOutput("flatpricePlot")
      
    )
    
  )
  
))