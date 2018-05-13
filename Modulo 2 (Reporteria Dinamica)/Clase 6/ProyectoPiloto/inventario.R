library(readr)
library(dplyr)
#setwd("C:/Users/PACHACAMA/Dropbox/ANALISIS INVENTARIOS - Peter/DATOS INVENTARIOS")
setwd("C:/Users/Personal/Dropbox/ANALISIS INVENTARIOS - Peter/DATOS INVENTARIOS")

#Transacciones Anuales por Articulo ------
transacciones_anual <- function(data){
  data_trasacc = data %>% 
    select("Cód Transacción","Cód Transacción_1",
           "Descripción Transacción" ,"Artículo","Descripción Artículo",
           "Cantidad","Ref Orden 1","Ubicación","Almacén","Coste","Coste Inventario",
           "Coste Total","Creado","Hora Creación","Fecha Aplicada")%>%
    filter(`Cód Transacción_1` %in% c('INTSHIP','WOISS')) %>%  arrange(`Artículo`) %>%
    count(`Artículo`, `Descripción Artículo`,sort=TRUE)
  
  return(data_trasacc)
}


#Carga de Datos -----------------------------
data_anual17 = read_csv("TRANSACCIONES 2017.csv")

data_anual16 = read_delim("TRANSACCIONES 2016.csv","\t", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                          trim_ws = TRUE)

data_anual15 =  read_delim("TRANSACCIONES 2015.csv","\t", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE)

data_anual14 = read_csv("TRANSACCIONES 2014.csv")

data_anual13 = read_csv("TRANSACCIONES 2013.csv")

#Juntar los Datos -----------------------------

resumen_hist = transacciones_anual(data_anual13) %>% 
  left_join(transacciones_anual(data_anual14),by=c("Artículo","Descripción Artículo"))%>% 
  left_join(transacciones_anual(data_anual15),by=c("Artículo","Descripción Artículo"))%>% 
  left_join(transacciones_anual(data_anual16),by=c("Artículo","Descripción Artículo"))%>% 
  left_join(transacciones_anual(data_anual17),by=c("Artículo","Descripción Artículo"))

names(resumen_hist)[3:7] = 2013:2017 

resumen_hist[is.na(resumen_hist)] = 0

View(resumen_hist)

#plot(x=2013:2017,as.numeric(resumen_hist[1,3:7]),type = 'l')
library(ggplot2)

#Funcion que crea gráficos ----------------------------
grafico_articulo <- function(articulo=1,tabla_datos=resumen_hist){
  
  Tabla_graf =data.frame("Año"=2013:2017, "Transacciones"=as.numeric(tabla_datos[articulo ,3:7]))
  
  graf <- ggplot(Tabla_graf, aes(x=`Año`, y=`Transacciones`)) + geom_line() + 
    geom_point() + ggtitle(paste0('Articulo Codigo: ',as.character(tabla_datos[articulo ,1])))
  return(graf)
}
# Creamos Grafico
articulo = 13
G = grafico_articulo(articulo,tabla_datos = resumen_hist)
G

# Crear csv con Resumen Historico de Datos --------------
write.csv(resumen_hist,file= "Tabla de Rotacion Articulos.csv")





