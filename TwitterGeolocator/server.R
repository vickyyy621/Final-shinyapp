
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(wordcloud2)

load(paste(getwd(),"/dataImage.RData", sep = ""))

shinyServer(function(input, output) {
  output$plotLocation <- renderPlot({
    if (input$option == "NY"){
      locationData <- data.frame("Area" = "New York", "Latitude" = 40.712946,"Longitude" = -74.005854)
      visualMap(locationData,-125,20,-70,50,1,5)
    }else if(input$option == "houston"){
      locationData <- data.frame("Area" = "Houston", "Latitude" = 29.760204,"Longitude" = -95.369754)
      visualMap(locationData,-125,20,-70,50,1,5)
    }else if(input$option == "miami"){
      locationData <- data.frame("Area" = "Miami", "Latitude" = 25.761624,"Longitude" = -80.192298)
      visualMap(locationData,-125,20,-70,50,1,5)
    }
  })
  
  output$plotWeather <- renderWordcloud2({
    if (input$option == "NY"){
      wordcloud2(NewYorkTable)
    }else if(input$option == "houston"){
      wordcloud2(HoustonTable)
    }else if(input$option == "miami"){
      wordcloud2(MiamiTable)
    }
  })
  
})
