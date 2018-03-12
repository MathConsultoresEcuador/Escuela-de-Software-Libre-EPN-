#CARGAS DE LIBRERIA
#Packages:paquetes 
#aprender a instalar un paquete
library(MASS)#cargar el paquete MASS
Cars93
head(Cars93)
head(Cars93, 5)#para una pequeña visualizacion y el numero cinco representa las cinco primeras 
Cars93=Cars93 #para que me reconozca en el global environment
View(Cars93) #para visualizar completamente la base
class(Cars93)

#IMPRIMA LA ESTRUCTURA DE LOS DATOS Cars 93 (use str), explique la salida
str(Cars93)
Cars93$Model #el simbolo de $ significa para identificar una etiqueta a cada uno de los factores
#llamando una colunma dentro de la base de datos

#¿CUALES SON LOS NIVELES DE TYPE? (USE LA FUNCION levels)
levels(Cars93$"Type")
#UTILICE LA FUNCION PARA HACER UNA TABLA DE CONTEO
table(Cars93$"Type")

#¿CUANTOS VALORES UNICOS TIENE LA VARIABLE "RPM"(use la funcion unique o levels)
#unique para que me salga una sola vez no repetidos
unique(Cars93$"RPM")
length(unique(Cars93$"RPM"))
table(Cars93$"DriveTrain", Cars93$"Type" )
with(Cars93, table(Type))#para no estar usando cada vez Cars93$" "
with(Cars93, table(DriveTrain, Type))
