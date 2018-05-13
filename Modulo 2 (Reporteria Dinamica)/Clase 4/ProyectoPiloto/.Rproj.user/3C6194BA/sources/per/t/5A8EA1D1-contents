# Depuracion y Limpieza ---------
library(dplyr)
getwd()
#Ejecutar Codigo "CargaDatos.R" -----
source('Analisis/Datos/CargaDatos.R') #Ejecutar el codigo contenido en el archivo especificado

#Datos Perdidos ------
{
  summary(Datos2013) ; class(Datos2013)
  summary(Datos2014) ; class(Datos2014)
  summary(Datos2015) ; class(Datos2015)
  summary(Datos2016) ; class(Datos2016)
  summary(Datos2017) ; class(Datos2017)
}
#Transformar a Data.frame ------
{
  Datos2013 <- as.data.frame(Datos2013)
  Datos2014 <- as.data.frame(Datos2014)
  Datos2015 <- as.data.frame(Datos2015)
  Datos2016 <- as.data.frame(Datos2016)
  Datos2017 <- as.data.frame(Datos2017)
}

#Arregalar 2015 (Dato) ----------------------
Datos2015$`Fecha Aplicada` = as.character(Datos2015$`Fecha Aplicada`)
Datos2015$`Fecha Caducidad` = as.character(Datos2015$`Fecha Caducidad`)
Datos2015$`Fecha Aplicada Fecha Modificación` = as.character(Datos2015$`Fecha Aplicada Fecha Modificación` )
Datos2015$`Hora Creación` = as.character(Datos2015$`Hora Creación`)
Datos2015$Creado = as.character(Datos2015$Creado)

#Reemplazar Perdidos (*,+,-,'N') ---------------
Datos2013[Datos2013=='*' | Datos2013== '+' | Datos2013=='-' | Datos2013=='N'] = NA
Datos2014[Datos2014=='*' | Datos2014== '+' | Datos2014=='-' | Datos2014=='N'] = NA
Datos2015[Datos2015=="*" | Datos2015== '+' | Datos2015=='-' | Datos2015=='N'] = NA
Datos2016[Datos2016=='*' | Datos2016== '+' | Datos2016=='-' | Datos2016=='N'] = NA
Datos2017[Datos2017=='*' | Datos2017== '+' | Datos2017=='-' | Datos2017=='N'] = NA

#Consolidación -------
Datos2013$`Año` = 2013
Datos2014$`Año` = 2014
Datos2015$`Año` = 2015
Datos2016$`Año` = 2016
Datos2017$`Año` = 2017

bind_rows(Datos2013, Datos2014)

#Corregir Columna Ref Orden 2
Datos2015$`Ref Orden 2` = as.numeric(Datos2015$`Ref Orden 2`)
Datos2016$`Ref Orden 2` = as.numeric(Datos2016$`Ref Orden 2`)
Datos2017$`Ref Orden 2` = as.numeric(Datos2017$`Ref Orden 2`)

Datos2015$`Ref Orden 3` = as.numeric(Datos2015$`Ref Orden 3`)
Datos2016$`Ref Orden 3` = as.numeric(Datos2016$`Ref Orden 3`)
Datos2017$`Ref Orden 3` = as.numeric(Datos2017$`Ref Orden 3`)

class(Datos2015$`Hora Creación`)

#ERROR: Cohercion difftime - character ---------
Datos2015aux=Datos2015
Datos2015aux$`Hora Creación` = as.Date(Datos2014$`Hora Creación`)

#-----------------------------------------------
BDDconsolidada = Datos2013 %>% 
  bind_rows(Datos2014) %>%
  bind_rows(Datos2015aux) %>% 
  bind_rows(Datos2016) %>% 
  bind_rows(Datos2017)

Datos2015$`Ref Orden 2`
#Resumen de Datos Perdidos x Variable  ---------
#Funcion para crear resumen de datos perdidos
ResumenNAs = function(BDD){
  #Porcentaje de perdidos
  porcentaje_NA<-function(x){
    perdidos=sum(is.na(x))
    total=length(x)
    porcentaje=100*perdidos/total
    return(porcentaje)
  }
  
  resumen= apply(BDD,MARGIN = 2,porcentaje_NA)
  resumen= data.frame(Variables = names(resumen) , Porcentaje_perdidos = resumen)
  rownames(resumen) = 1:dim(resumen)[1]
  
  return(resumen)
}

#Tablas de Resumen de Perdidos
resumen2013 = ResumenNAs(Datos2013)



#Eliminar Variables que no tienen informacion ----



#


