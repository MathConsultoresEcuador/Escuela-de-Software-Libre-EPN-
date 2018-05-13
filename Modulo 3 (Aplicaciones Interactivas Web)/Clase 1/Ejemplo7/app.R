library(shiny)
library(readr)
library(dplyr)
library(DT)

datos <- read_delim("nacimientos2015.csv", 
                              ";", quote = "\\\"", escape_double = FALSE, 
                              locale = locale(encoding = "ISO-8859-1"), 
                              trim_ws = TRUE)

tabla_resum = datos %>% 
  group_by(PROVINCIA) %>% 
  summarize(NACIMIENTOS=sum(TOTAL))


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
                   value = 5),
      sliderInput(inputId = "grupos",
                   label = "Número de grupos",
                   value = 4,min=1,max=10
      )
    ),
    mainPanel(
      h1("Nivel 1"),
      h2("Nivel 2"),
      img(src="imagen.png", width='80%'),hr(),
      
      h3("Nivel 3"),hr(),
      plotOutput("grafico"),
      
      h4("Nivel 4"),
      plotOutput("grafico2"),
      
      h5("Nivel 5"),
      dataTableOutput("tabla"),
      h6("Nivel 6")
    )
  )
  
)


server= function(input,output){
  output$raiz = renderText(paste("La raiz cuadrarda de", 
                                 input$n1, "es:",sqrt(input$n1)))
  output$producto = renderText(paste("El producto entre", 
                                     input$n1, "y",input$n2,"es:",input$n1*input$n2))
  output$variable = renderText(paste("La variable x es iguala a :", x ))
  
  output$grafico = renderPlot(hist(iris$Sepal.Length,breaks = input$grupos))
  
  output$grafico2 = renderPlot(barplot(tabla_resum$NACIMIENTOS))
  
  output$tabla = renderDataTable(tabla_resum)
}

shinyApp(ui,server)