#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(purrr)
pacman::p_load("tidyverse","ggplot2","stringr","read.dbc","lubridate","shinydashboard","plotly", "magrittr","shinydashboardPlus")



design <- function(){
    list(width = 12,
         title = "Closable Box", 
         closable = F, 
         status = "warning", 
         solidHeader = FALSE, 
         collapsible = TRUE,
         p("Box Content"))
    
}


sliderInput01 <- function(id) {
    fluidRow(
        boxPlus(
            width = 12,
            height = 500,
            title = "Closable Box", 
            closable = F, 
            status = "warning", 
            solidHeader = FALSE, 
            collapsible = TRUE,
            p("Box Content"),
            column(width = 2,
                sliderInput(id, label = id, min = 0, max = 1, value = 0.5, step = 0.1),   
                selectInput(id,label = id, choices = c("ola", "turo bom")),
                selectInput(paste(id,id),label = id, choices = c("ola", "turo bom")))
            ))
    
}

vars <- c("alpha", "beta", "gamma", "delta")
sliders <- map(vars, sliderInput01)


header <- dashboardHeaderPlus()
body <- dashboardBody(sliders)

sidebar <- dashboardSidebar(disable = T)

ui <- dashboardPagePlus(header, sidebar, body)




server <- function(input, output, session) {
   
    
  
}



shinyApp(ui , server)

