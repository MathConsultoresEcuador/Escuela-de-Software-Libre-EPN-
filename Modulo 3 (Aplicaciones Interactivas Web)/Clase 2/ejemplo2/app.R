

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
  dateInput("date",
            h3("Date Input"),
            value = "2018-05-05"),
  textOutput("salida")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$salida <- renderText(
     
     if(input$date > Sys.Date()) s="sasa"
   )
}

# Run the application 
shinyApp(ui = ui, server = server)

