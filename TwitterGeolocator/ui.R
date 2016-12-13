library(shiny)
library(shinydashboard)
library(ggmap)
library(ggplot2)
library(wordcloud2)

dashboardPage( 
  dashboardHeader(title="Twitter Geolocator"), 
  dashboardSidebar(
    selectInput("option", "Options:",
                list("Weather of New York" = "NY", 
                     "Weather of Houston" = "houston",
                     "Weather of Miami" = "miami"))
  ),
  
  dashboardBody(
    column(5,
           plotOutput("plotLocation")
    ),
    column(7,
           wordcloud2Output("plotWeather")
    )
  )
  
)
