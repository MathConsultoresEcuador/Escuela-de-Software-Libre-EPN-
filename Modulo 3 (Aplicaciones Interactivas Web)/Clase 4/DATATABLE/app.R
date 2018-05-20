# Ejemplo DataTable

library(DT)

ui <- fluidPage(
  dataTableOutput("tabla")
)

server <- function(input, output) {

  output$tabla <- renderDataTable(mtcars,
                                  filter = 'top',
                                  style = 'bootstrap',
                                  options = list(language = list(url = 'spanish.json'))
  )
  
}

shinyApp(ui, server)
