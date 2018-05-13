library(shiny)

ui = fluidPage(
  titlePanel("Titulo de la App"),
  fluidRow(
    column(6,wellPanel("Entrada prueba")),
    column(6,"Salida prueba")
  )
  
)


server= function(input,output){
  
  
}

shinyApp(ui,server)