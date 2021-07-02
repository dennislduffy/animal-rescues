#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("London Animal Rescues"), 
  sidebarLayout(
    sidebarPanel(
      uiOutput("animal"), #come back and fix the selected argument
      selectInput("year", "Select a year", choice = unique(animal_rescues$cal_year), selected = 2021)
    ),
    mainPanel(
      leafletOutput("mymap")
      )
  ),
  
)
