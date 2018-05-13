
library(shiny)
library(tidyverse)
library(readr)
library(DT)
#Parametros Iniciales --------------------------------
BDD <- read_delim("C:/Users/FEPON 4/Desktop/Clase 2/nacimientos2015.csv", 
                              ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                              trim_ws = TRUE)

BDD$PROVINCIA[BDD$PROVINCIA=="ZAMORA CHINCHIP"] = "ZAMORA CHINCHIPE"

provincias = unique(BDD$PROVINCIA)

# User Interface -------------------------------------
ui <- fluidPage(
  
   sidebarPanel(
     
     tags$h3("Selecciona Inputs"),
     selectInput(inputId = "provincia",
                 label = "Seleccione Provincia",
                 choices = provincias)
     
   ),
   
   mainPanel(
     tags$h2("Informe por Cantón"),
     plotOutput("grafico"),
     dataTableOutput("tabla")
   )
  
)

# Servidor -------------------------------------------
server <- function(input, output) {

  #Grafico 
  output$grafico = renderPlot(expr = {
    data = BDD %>% 
      filter(PROVINCIA==input$provincia) %>% 
      group_by(CANTON) %>% 
      summarise(NACIMIENTOS=sum(TOTAL))
    barplot(data$NACIMIENTOS,names.arg = data$CANTON)
  })
  
  #Tabla
  output$tabla = renderDataTable(data = BDD %>% 
                                   filter(PROVINCIA==input$provincia) %>% 
                                   group_by(CANTON) %>% 
                                   summarise(NACIMIENTOS=sum(TOTAL)) %>% datatable()
  )
}

# Run the application 
shinyApp(ui = ui, server = server)

