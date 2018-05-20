# Ejemplo menú anidado

menu <- data.frame(niv1=c("A","A","A","B","B","C","C","C","C"),
                   niv2=c("A.1","A.2","A.3","B.1","B.2", "C.1", "C.2", "C.3", "C.4" ))

opciones_1 <- unique(menu$niv1)


ui <- fluidPage(
  
  selectInput('nivel1',
              h4("Seleccione una opción nivel 1"),
              choices=opciones_1
  ),
  
  selectInput('nivel2',
              h4("Seleccione una opción nivel 2"),
              choices=NULL
  )
  
)

server <- function(input, output, session) {

  observe({
    opciones_2 <- menu$niv2[menu$niv1==input$nivel1]
    updateSelectInput(session, "nivel2",
                      choices = opciones_2)
  })
  
}

shinyApp(ui, server)

