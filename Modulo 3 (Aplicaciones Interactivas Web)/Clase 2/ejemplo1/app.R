
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30),
         fileInput("archivo",label="Subir Archivo",
                   buttonLabel = "Buscar",
                   placeholder = "No has seleccionado un archivo"),
         helpText("NOTA: Primero selecciona un archivo para que se genere un informe"),
         passwordInput(inputId = "Clave",label = "Password",value = "",placeholder = "Introduce Clave"),
         #submitButton(text = "Generear Informe"),
         sliderInput(inputId = "Numero2in",label = "Selecciona Numero",min=1,max=10,value = "3",step = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot"),
         tags$h2(textOutput("respuesta1")),tags$hr(),
         tags$h3(textOutput("respuesta2"))
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
   
   output$respuesta1 <- renderText(input$bins)
   
   output$respuesta2 <- renderText(input$Numero2in)
   
}

# Run the application 
shinyApp(ui = ui, server = server)

