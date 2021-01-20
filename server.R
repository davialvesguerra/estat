setwd("C:/Users/601545/Desktop/projetos/estat/shiny/")






#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



# Define server logic required to draw a histogram
server <- function(input, output) {
    data <- reactive({
        # input$file1 will be NULL initially. After the user selects
        # and uploads a file, it will be a data frame with 'name',
        # 'size', 'type', and 'datapath' columns. The 'datapath'
        # column will contain the local filenames where the data can
        # be found.
        inFile <- input$file1
        
        if (is.null(inFile))
            return(NULL)
        
        read.csv(inFile$datapath)
    })
    
    
    output$contents <- renderDT({
        
        DT::datatable(
            data(),
            filter = 'top', extensions = c('Buttons', 'Scroller'),
            rownames = FALSE,
            options = list(scrollY = 200,
                           scrollX = 500,
                           deferRender = TRUE,
                           scroller = TRUE,
                           paging = TRUE,
                           # pageLength = 25,
                           buttons = list('excel',
                                          list(extend = 'colvis', targets = 0, visible = F)),
                           
                           fixedColumns = TRUE)
        )
    })
    
    
    plotInput <- function(){
        data() %>% 
            group_by(idade) %>% 
            summarise(n = n()) %>% 
            ggplot(aes(idade,n))+
            geom_col()
    }
    
    
    
    output$plot <- renderPlot({  plotInput() })
    
    
    
    output$downloadPlot <- downloadHandler(
        filename = "Shinyplot.png",
        content = function(file) {
            png(file)
            plotInput()
            dev.off()
        })   
    
    
    
    
}
