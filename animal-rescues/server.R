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

#Clean up animal names
animal_rescues$animal_group_parent <- animal_rescues$animal_group_parent %>%
  str_replace("cat", "Cat") %>%
  str_replace("Budgie", "Bird")
  
#Locate unknown animals and condense to unknown
x <- str_detect(animal_rescues$animal_group_parent, "Unknown")

animal_rescues$animal_group_parent <- replace(animal_rescues$animal_group_parent, x, "Unknown")


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

