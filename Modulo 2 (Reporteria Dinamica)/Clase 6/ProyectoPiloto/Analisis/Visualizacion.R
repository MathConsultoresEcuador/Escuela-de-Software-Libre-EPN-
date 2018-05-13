# Visualizacion -----------
#Rotacion Inventario ---------------------
library(forecast)
library(highcharter)

#Cargar Datos
getwd()
load(file="Analisis/Datos/Rotacion.RData")

#Funcion que grafica series --------------
grafica = function(Datos,articulo){
  Rotacion=Datos
  fila=articulo
  
  articulo = Rotacion[fila,1]
  serie = as.numeric(Rotacion[fila,-1])
  
  (serie=ts(serie))
  modelo = ets(serie)
  
  prediccion = forecast(modelo, h = 3, level = 85)
  
  graf = hchart(prediccion)
  
  return(graf)
}

grafica(Rotacion,4)


# Analisis de Regresión -----------------
load("Analisis/Modelos.RData")

plot(cars)

par(mfrow=c(2,3))

plot(modelo1,1:6)

plot(modelo2,1:6)

plot(modelo3,1:6)

plot(modelo4,1:6)

par(mfrow=c(1,1))




