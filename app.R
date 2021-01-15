setwd("C:/Users/601545/Desktop/projetos/estat/shiny/") 
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

pacman::p_load("tidyverse","ggplot2","stringr","read.dbc",'magrittr',"lubridate","shinydashboard","plotly","DT","wesanderson","shiny")



# Define UI for application that draws a histogram
ui <- htmlTemplate("www/template.html",
                   plot = plotOutput("dist"),
                   slider = sliderInput("num", "Number of points", 1,100,50)
                   
)


server <- function(input, output) {
    output$dist <- renderPlot({
        
        
        x <- rnorm(input$num)
        y <- rnorm(input$num)
        plot(x,y)
        
        
    }
  )
}

# Run the application 
shinyApp(ui = ui , server = server )
