ui <- fluidPage(
  tags$head(tags$link(rel='stylesheet', type='text/css', href='estilo.css'),
            tags$link(rel='shortcut icon', href='icono.ico', type='image/x-icon')),
  fluidRow(
    column(3,
           img(src='logo.png', height=150, width=150, class='centrada')),
    column(9, 
           h1('Título de la página'))
  ),
  
  titlePanel(title=NULL, windowTitle='Jorge Albuja Delgado'),
  fluidRow(
    column(3,
           wellPanel(
             h2('Controles'),
             selectInput('periodo',
                         h4('Período'),
                         c('Opción 1'=1,
                           'Opción 2'=2)
             )
           )
    ),
    column(9,
           h1('...contenido h1...'),
           h2('...contenido h2...'),
           h3('...contenido h3...'),
           h4('...contenido h4...'),
           h5('...contenido h5...'),
           h6('...contenido h6...')
    )
  )
)                

server <- shinyServer(
  function(input,output) {
  }
)

shinyApp(ui, server)