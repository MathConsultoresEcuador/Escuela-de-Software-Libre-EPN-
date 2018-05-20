library(shiny)

ui <- fluidPage(
  numericInput(inputId = "grupos",
              label = "Número de grupos",
              value = 4),
  plotOutput("grafico")
)

server <- function(input, output) {
  output$grafico <- renderPlot({
    hist(iris$Sepal.Length,
         breaks = input$grupos,
         main = "Histograma")
  })
}

shinyApp(ui, server)

