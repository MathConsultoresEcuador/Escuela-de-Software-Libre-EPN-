library(shiny)
library(rpivotTable)

votos <- readRDS('votos.rds')

ui = fluidPage(
  h1("Tabla dinámica Titanic", align="center"),
  rpivotTableOutput("Tabla")
)

server = function(input, output) {
  output$Tabla <- renderRpivotTable({
    change_locale(rpivotTable( votos,
                               rows = "PROVINCIA_NOMBRE",
                               cols = c("CANDIDATO"),
                               aggregatorName = "Cuenta",
                               vals = "Freq"),
                  'es')
  })
}

shinyApp(ui, server)
