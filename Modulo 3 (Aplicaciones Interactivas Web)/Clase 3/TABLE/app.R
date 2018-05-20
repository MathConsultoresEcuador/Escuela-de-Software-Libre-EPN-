library(shiny)

ui <- fluidPage(
  tableOutput("tabla")
)

server <- function(input, output) {
  output$tabla <- renderTable(iris, striped = TRUE)
}

shinyApp(ui, server)

