#======= Carga de Datos ========
library(readr)
library(readxl)
getwd()
#Parte 1 --------------
Datos2013 <- read_csv("Analisis/Datos/BDD/TRANSACCIONES 2013.csv")
Datos2014 <- read_csv("Analisis/Datos/BDD/TRANSACCIONES 2014.csv")
Datos2015 <- read_excel("Analisis/Datos/BDD/TRANSACCIONES 2015.xlsx")
#Parte 2 #############
Datos2016 <- read_delim("Analisis/Datos/BDD/TRANSACCIONES 2016.csv", 
                        "\t", escape_double = FALSE, locale = locale(encoding = "ISO-8859-1"), 
                        trim_ws = TRUE)
#Parte 3 =============
Datos2017 <- read_csv("Analisis/Datos/BDD/TRANSACCIONES 2017.csv")
