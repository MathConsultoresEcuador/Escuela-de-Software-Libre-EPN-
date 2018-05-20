# Ejemplo menú anidado

dpa <- readRDS("dpa.rds")

provincias <- unique(dpa$PROVINCIA_NOMBRE)


ui <- fluidPage(
  
  selectInput('pro',
              h4("Provincia"),
              choices=provincias
  ),
  
  selectInput('can',
              h4("Cantón"),
              choices=NULL
  ),
  
  selectInput('par',
              h4("Parroquia"),
              choices=NULL
  )
  
)

server <- function(input, output, session) {

  observe({
    cantones <- dpa$CANTON_NOMBRE[dpa$PROVINCIA_NOMBRE==input$pro]
    updateSelectInput(session, "can",
                      choices = cantones)
  })
  
  observe({
    parroquias <- dpa$PARROQUIA_NOMBRE[dpa$CANTON_NOMBRE==input$can]
    updateSelectInput(session, "par",
                      choices = parroquias)
  })
  
}

shinyApp(ui, server)

