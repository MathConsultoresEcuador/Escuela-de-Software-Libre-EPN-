library(shiny)
library(ggplot2)
library(plotly)

ui <- fluidPage(
  plotlyOutput("grafico")
)

server <- function(input, output) {
  output$grafico <- renderPlotly({
    g <- ggplot(mtcars) +
      geom_histogram(aes(x=mpg))
    ggplotly(g)
  })
}

shinyApp(ui, server)

