# 0. Paquetes y variables globales
library(tidyverse)
library(rgdal)
library(leaflet)

votos <- readRDS('votos.rds') %>% 
  filter(PROVINCIA_CODIGO < 25)

candidatos <- unique(votos$CANDIDATO)

shppro <- readOGR(dsn='shp', layer='provincias', stringsAsFactors=FALSE)
shppro$CODPRO <- as.integer(shppro$CODPRO)
proy <- CRS('+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0')
shppro <- sp::spTransform(shppro,proy)

# 1. Interfaz de usuario
ui <- fluidPage(
  titlePanel(
    title = h3('Resultados Presidente Ecuador - Primera Vuelta 2017'),
    windowTitle = 'Resultados Presidente Ecuador - Primera Vuelta 2017'
  ),
  br(),
  fluidRow(
    column(3,
           selectInput('candidato',
                       h4('Candidato'),
                       candidatos)
    ),
    column(9,
           leafletOutput('mapa', height='600px')
    )
  )
)

# 2. Servidor
server <- shinyServer(function(input,output,session) {
  
  output$mapa <- renderLeaflet({
    leaflet() %>%
      addTiles(group = 'Mapa Base',
               options = tileOptions(opacity = 1)) %>%
      setView(-78, -1.4, zoom = 6)
  }) 
  
  votos_candidato <- reactive({
    votos %>%
      filter(CANDIDATO==input$candidato) %>% 
      arrange(PROVINCIA_CODIGO)
  })
  
  observe({
    paleta_colores <- colorBin(c("red","yellow","green"), votos_candidato()$PORCENTAJE_VOTOS, 8)
    clic <- paste0('<strong>Provincia: </strong>',
                       votos_candidato()$PROVINCIA_NOMBRE,
                       '<br><strong>Votos: </strong>',
                       votos_candidato()$VOTOS,
                       '<br><strong>Porcentaje: </strong>',
                       votos_candidato()$PORCENTAJE_VOTOS)
    over <- votos_candidato()$PROVINCIA_NOMBRE
    leafletProxy('mapa', data = votos_candidato()) %>%
      addPolygons(data = shppro,
                  layerId = shppro$CODPRO,
                  popup = clic,
                  label = over,
                  fillOpacity = 0.7,
                  fillColor = paleta_colores(votos_candidato()$PORCENTAJE_VOTOS),
                  color='#000000',
                  weight = 2,
                  group = 'Provincias') %>% 
      clearControls() %>%
      addLegend('bottomright',
                pal = paleta_colores,
                values = ~votos_candidato()$PORCENTAJE_VOTOS,
                title = 'Votación por provincia (%)',
                opacity = 1) %>%
      addLayersControl(
        overlayGroups = c('Mapa Base', 'Provincias'),
        options = layersControlOptions(collapsed = FALSE)
      )
  })
  
})

# 3. Aplicación Shinny
shinyApp(ui, server)