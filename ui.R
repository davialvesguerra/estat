#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)




library(shinydashboard)

ui <- dashboardPage(
    dashboardHeader(),
    dashboardSidebar(
        sidebarMenu(id="tabs",
                    menuItem("Table import", tabName = "table", icon=icon("table"), selected=TRUE),
                    menuItem("Plot", tabName="plot", icon=icon("line-chart")))
                    
        ),
    dashboardBody(
    
        tabItems(
        tabItem(
            tabName = "table",
            fluidRow(
                box(title = "Unidade", solidHeader = TRUE, 
                    status = "primary", width = 4,
                    fileInput("file1", "Choose CSV File",
                              accept = c(
                                  "text/csv",
                                  "text/comma-separated-values,text/plain",
                                  ".csv"))),
                box(title = "Unidade", solidHeader = TRUE, 
                    status = "primary", width = 8,
                    DTOutput("contents"))
            )
        ),
        
        
        tabItem(
            tabName = "plot",
            fluidRow(
                box(title = "Unidade", solidHeader = TRUE, 
                    status = "primary", width = 4,
                    plotOutput("plot"))
            )
        )
       )
        
    )
    
    
    
)







