library(shiny)

x = 100

ui = fluidPage(
  titlePanel("Titulo de la App"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "n1",
                   label = "Número 1:",
                   value = 9),
      numericInput(inputId = "n2",
                   label = "Número 2:",
                   value = 5)
    ),
    mainPanel(
      tabsetPanel(
        
        tabPanel("Gráfico","Ubicar gráfico aquí",
                  textOutput("raiz")
                 ),
        tabPanel("Tabla","Aquí va la tabla",
                 textOutput("producto")
                 ),
        tabPanel("Mapa", "Colocar el mapa",
                 textOutput("variable")
                 )
        
      )
    )
  )
  
)


server= function(input,output){
  output$raiz = renderText(paste("La raiz cuadrarda de", 
                                 input$n1, "es:",sqrt(input$n1)))
  output$producto = renderText(paste("El producto entre", 
                                     input$n1, "y",input$n2,"es:",input$n1*input$n2))
  output$variable = renderText(paste("La variable x es iguala a :", x ))
  
}

shinyApp(ui,server)