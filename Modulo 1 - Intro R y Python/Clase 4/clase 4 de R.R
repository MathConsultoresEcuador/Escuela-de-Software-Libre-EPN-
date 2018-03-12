#INGRESAR DIFERENTES DATOS A r
#IMPORTAR DATOS CON R
#la primera funcion es read.table(): es la mejor opcion para leer archivos .txt
# read.table("<NombreArchivo>.txt", header=TRUE, sep=" ", dec=".")
df=read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt", header=FALSE, sep="", dec=".")
df
class(df)

#strip.white=T es para eliminar el espacio antes de BEST (LIMPIA LOS ESPACIOS EN BLANCO)
#na.strings="EMPTY" para los valores perdidos cambia por <NA>

df2=read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/scores_timed.txt", header = FALSE, sep = "/", strip.white = T, na.strings = "EMPTY")
df2
class(df2)

#funciones read.csv() y read.csv2()
#se diferencia por la programacion regional o donde nos encontremos
#read.csv() permite leer archivos  separados por comas ","
#read.csv2() permite leer archivos  separados por puntos y comas ";"
df3=read.csv("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv", header = TRUE)
df3

str(df3)#str nos da la estructuras de la base de datos la forma de las columnas
#objeto factor es de estilo categorico
class(df3)

tm=read.csv2("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.csv", header = TRUE)
tm # al poner esta funcion nos da un error ya que el separador es una coma

#FUNCION read.xlsx()
#permite a la libreria xlsx y permite importar archivos desde excel. para usarla es necesario
#cargar la libreria con el codigo:
#library(xlsx)
#R no reconoce los (\) solo (/) ó (\\)
library(xlsx)
getwd()#esta funcion nos dice donde estamos ubicados
df4=read.xlsx(file="00 Data/iris.xlsx", sheetIndex = 1, as.data.frame = TRUE, header=TRUE)
head(df4) # en el file depende como se guardo la carpeta
#la funcion head es para ver si se importo correctamente el archivo
class(df4)

#FUNCION read_excel()
#es una alternativa a read.xlsx() tiene mejor rendimiento computacional:
#ideal para cargar archivos pesados es mas rápido
#para esta hay que instalar readxl
library(readxl)# y cargar mediante library()
df5=read_excel("00 Data/iris.xlsx")
head(df5)
class(df5)
df5=as.data.frame(df5)#es para transformar a data.frame
class(df5)

# Importar archivos de SPSS, STATA y SAS
#no siempre se puede descargar base de datos la forma de estos archivos (STATA)
library(foreign)

#Funcion read.spss()
#permite leer archivos desde SPSS
df6=read.spss("00 Data/Anxiety2.sav", to.data.frame = T)# recodifica 
head(df6)
class(df6)
#para determinar algo en especifico filtrar
df6.high=df6[df6$tension=="high",]#(,) despues de esto quiere decir que selecciono toda la columna
# y como es un data.frame tiene dos dimensiones
df6.high
#Funcion read.dta()
#permite leer archivos con extension .dta de STATA
df7=read.dta("00 Data/iris_stata.dta")
head(df7)
class(df7)

#Funcion read.sas7bdat (es muy caro aunque muy bueno)
#parte del paquete sas7bdat, permite leer archivos con extension .sas7bdat de SAS
#hay que instalar sas7bdat y cargarla
library(sas7bdat)
df8=read.sas7bdat("00 Data/beer.sas7bdat")
head(df8)
class(df8)

