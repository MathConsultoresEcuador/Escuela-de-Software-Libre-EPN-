# Transformación a Formato Estándar --------
library(dplyr)
library(reshape2)

getwd()
#source("Analisis/Datos/LimpiezaDatos.R")
load("Analisis/Datos/Data_limpia.RData")

BDDLimpia %>% distinct(`Descripción Transacción`)
BDDLimpia %>% distinct(`Desc. Planta`)
BDDLimpia %>% distinct(`Ubicación`)
BDDLimpia %>% distinct(`Almacén`)
BDDLimpia %>% distinct(`Cajón`)
BDDLimpia %>% distinct(`Tipo Orden`)
BDDLimpia %>% distinct(`Realizado Por`)

BDDLimpia %>% distinct(`Descripción Transacción`,
                       `Desc. Planta`,`Ubicación`,
                       `Almacén`,`Cajón`,`Realizado Por`) %>% 
  arrange(`Descripción Transacción`)
# arrange(desc(`Descripción Transacción`))

# Transferencias Internas (Recepción - Salida)
BDDLimpia %>% filter(`Descripción Transacción` %in% 
                       c('Transferencia Interna - Recepción',
                         'Transferencia Interna - Salida'))


aux1 = BDDLimpia %>% group_by(`Artículo`, `Descripción Artículo`,`Año`) %>% 
  summarise(Cantidad_Anual=sum(Cantidad),Coste_Medio=mean(Coste),Coste_Total_Anual=sum(`Coste Total`)) %>% 
  arrange(desc(`Cantidad_Anual`),`Artículo`,`Año`) 
  

Rotacion= BDDLimpia %>% group_by(`Artículo`, `Descripción Artículo`,`Año`) %>% 
  summarise(Cantidad_Anual=sum(Cantidad),Coste_Medio=mean(Coste),Coste_Total_Anual=sum(`Coste Total`)) %>% 
  arrange(desc(`Cantidad_Anual`),`Artículo`,`Año`) %>% 
  dcast(formula =  `Descripción Artículo` ~ `Año`,fun.aggregate =  sum, value.var="Cantidad_Anual") %>% 
  arrange(desc(`2017`),desc(`2016`))
  

# Rotacion = BDDLimpia %>% group_by(`Artículo`, `Descripción Artículo`,`Año`) %>% 
#   summarise(Cantidad_Anual=sum(Cantidad),Coste_Medio=mean(Coste),Coste_Total_Anual=sum(`Coste Total`)) %>% 
#   arrange(desc(`Cantidad_Anual`),`Artículo`,`Año`) %>% 
#   dcast(formula =  `Descripción Artículo` ~ `Año`,fun.aggregate =  sum, value.var="Cantidad_Anual")

getwd()
save(Rotacion,file="Analisis/Datos/Rotacion.RData")



