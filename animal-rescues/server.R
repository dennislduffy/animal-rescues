#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(leaflet)
library(tidytuesdayR)

#read in data for the week
tuesdata <- tidytuesdayR::tt_load('2021-06-29')

animal_rescues <- tuesdata$animal_rescues

server <- function(input, output, session) {

  #Create a map indicating site of animal rescues
  output$mymap <- renderLeaflet({
    animal_rescues%>%
      mutate(lng = as.numeric(longitude), 
             lat = as.numeric(latitude)) %>%
      filter(cal_year == "2010", 
             animal_group_parent == "Bird") %>%
      leaflet() %>%
      addTiles() %>%
      addMarkers(lng = ~lng, lat = ~lat)
  })

}

