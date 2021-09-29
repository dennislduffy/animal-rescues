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

#load data on ui side
#read in data for the week
#tuesdata <- tidytuesdayR::tt_load('2021-06-29')

#animal_rescues <- tuesdata$animal_rescues
animal_rescues <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-06-29/animal_rescues.csv')

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("London Animal Rescues"), 
  sidebarLayout(
    sidebarPanel(
      selectInput("animal", "Select an animal", choice = unique(animal_rescues$animal_group_parent)), 
      selectInput("year", "Select a year", choice = unique(animal_rescues$cal_year))
    ),
    mainPanel(
      leafletOutput("mymap", height = 600)
      )
  ),
)