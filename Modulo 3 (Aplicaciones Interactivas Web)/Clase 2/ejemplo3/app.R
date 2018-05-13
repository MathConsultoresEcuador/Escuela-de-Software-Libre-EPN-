

library(shiny)
library(dplyr)

#Parametros Iniciales ----------------------------------------------
listaCil = mtcars %>% select(cyl) %>% unique() %>% arrange(cyl) %>% unlist() %>% as.numeric() 
listaVar = names(mtcars)
listaVar = listaVar[listaVar!="cyl"]
# Define UI for application that draws a histogram -----------------
ui <- fluidPage(
  sidebarPanel(
    
    selectInput(inputId = "variable",label = "Variable",choices = listaVar),
    selectInput(inputId = "cilindros",label = "Numero de Cilindros",choices = listaCil ),
    numericInput(inputId = "cortes",label = "Breaks",value = 6,min=2,max=20)
    
  ),
  mainPanel(
    
    tags$h2("Histograma"),
    plotOutput("histograma")
    
  )
  
  
)

# Define server logic required to draw a histogram ------------------
server <- function(input, output) {

  #Histograma
  output$histograma = renderPlot(exp={
    data_aux = mtcars %>% filter(cyl==input$cilindros) %>% select(input$variable) %>% unlist()
    
    
    titulo=paste0("Histograma Variable: ",input$variable)
    hist(data_aux, main=,breaks = input$cortes)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

