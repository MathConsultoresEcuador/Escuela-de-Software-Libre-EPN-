ui <- fluidPage(
  titlePanel("Título de la App"),
  navlistPanel(
    "Grupo A",
    tabPanel("Multiplicación",
             numericInput(inputId = "n",
                          label = "Digite un número",
                          value = NULL),
             textOutput("raiz")
    ),
    tabPanel("Componente 2",
             "resultado"),
    tabPanel("Componente 3")
  )
)
server <- function(input, output) {

}

shinyApp(ui, server)
