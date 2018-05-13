#
library(shiny)
library(tidyverse)
library(readr)
library(DT)
library(leaflet)
#Parametros Iniciales --------------------------------
BDD <- read_delim("C:/Users/FEPON 4/Desktop/Clase 2/nacimientos2015.csv", 
                  ";", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                  trim_ws = TRUE)

BDD$PROVINCIA[BDD$PROVINCIA=="ZAMORA CHINCHIP"] = "ZAMORA CHINCHIPE"

provincias = unique(BDD$PROVINCIA)

inscripciones = unique(BDD$`TIPO DE INSCRIPCION`)

#Funcion que devuelve la Inscripcion dada la Provincia
inscripReact = function(provincia){
  
  BDD %>% filter(PROVINCIA==provincia) %>% select("TIPO DE INSCRIPCION") %>% unlist() %>% unique() 
  
}

# User Interface -------------------------------------
ui <- fluidPage(
  
  sidebarPanel(
    
    tags$h3("Selecciona Inputs"),
    selectInput(inputId = "provincia",
                label = "Seleccione Provincia",
                choices = provincias),
    selectInput(inputId = "inscripcion",
                label = "Inscripcion",
                choices = inscripciones)
    
  ),
  
  mainPanel(
    tags$h2("Informe por Cantón"),
    leafletOutput("mapa1"),
    plotOutput("grafico"),
    dataTableOutput("tabla"),
    leafletOutput("mapa2")
  )
  
)

# Servidor -------------------------------------------
server <- function(input, output,session) {
  #Reactividad Inputs
  observe({
    
    updateSelectInput(session,
                      inputId = "inscripcion",
                      label = "Inscripcion",
                      choices = inscripReact(input$provincia))
    
  })
  
  #Variable Reactiva
  datos = reactive({
    BDD %>% 
      filter(PROVINCIA==input$provincia,`TIPO DE INSCRIPCION`==input$inscripcion) %>% 
      group_by(CANTON) %>% 
      summarise(NACIMIENTOS=sum(TOTAL),REGISTROS=n())
  })
  
  #Grafico 
  output$grafico = renderPlot(expr = {
    
    barplot(datos()$NACIMIENTOS,names.arg = datos()$CANTON)
  })
  
  #Tabla
  output$tabla = renderDataTable(datos() %>% datatable()
  )
  
  #Mapa
  output$mapa1 = renderLeaflet({
    
    leaflet() %>% 
      setView(lng=-78,lat = -1,zoom=6) %>% 
      addTiles()
    
  })
  
  output$mapa2 = renderLeaflet({
    cities <- read.csv(textConnection("City,Lat,Long,Pop
                                      Boston,42.3601,-71.0589,645966
                                      Hartford,41.7627,-72.6743,125017
                                      New York City,40.7127,-74.0059,8406000
                                      Philadelphia,39.9500,-75.1667,1553000
                                      Pittsburgh,40.4397,-79.9764,305841
                                      Providence,41.8236,-71.4222,177994
                                      "))
    
    leaflet(cities) %>% addTiles() %>%
      addCircles(lng = ~Long, lat = ~Lat, weight = 1,
                 radius = ~sqrt(Pop) * 30, popup = ~City
      )
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

