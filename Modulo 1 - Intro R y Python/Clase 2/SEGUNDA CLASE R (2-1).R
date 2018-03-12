#CLASE DOS "CURSO DE R"
x=c(5, 2, 1, 4)
xx=c(1, 10, 15, 18)
y=rep(1,5) #"REP" REPLICAR ELEMENTOS DE VECTORES Y LISTAS EN ESTE CASO REPITE EL NUMERO 1, CINCO VECES
#rep(x,time)
z=c(TRUE, FALSE, TRUE, FALSE)
w=c("MARIE", "BETTY", "PETER")
sum(x)
sum(z)
range(x) #retorna el valor minimo y maximo del vector
c(x, y, 13)
xx
x
xx-x# como tienen el mismo numero de elementos
c(x,12)
y
c(x, 12)*y
1:6+1:9
x<=2 #el operador logico es == porque si solo es un = es solo para asignacion
z
x
y
x<=2 & z
x<=2 && z #son como tablas de verdad 

fechas <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
fechas
fechas <- as.Date(fechas, "%m/%d/%y") #as.Date cambia el vector texto a fecha

#importante los %m(mes)/%d(dia)/%Y(año) recordar que "y" debe ser mayuscula
fechas
class(fechas)

fechas2=c("01-05-1965","16-08-1975", "01-12-2015", "10-02-1990")
fechas2
fechas2=as.Date(fechas2, "%d-%m-%Y")#as.Date cambia el vector texto a fecha
#importante los %d(dia)/%m(mes)/%Y(año) recordar que "y" debe ser mayuscula
fechas2
class(fechas2)

# para calcular el tiempo que ha transcurrido
#INDEXACION PARA VECTORES
fechas2[2]
fechas2[1]
a=fechas2[2]-fechas2[1]# muestra en dias
a
class(a)
(fechas2[2]-fechas2[1])/30
Sys.Date()#la fecha de hoy

d=as.numeric(Sys.Date()-fechas2[1])#para cambiar el tipo de class
d
class(d)

d=c("Domingo Mayo 27", "Jueves Julio 07")
d
d=as.Date(d,"%a %b %d")
d

#TAMBIEN SE PUEDE EN ESPAÑOL COLOCANDO EL LENGUAJE POR DEFECTO EN ESPAÑOL PARA WINDOW
Sys.setlocale("LC_TIME", "English")
d=c("Sun May 27", "Thu Jul 07")
d
d=as.Date(d,"%a %b %d")
d

Sys.setlocale("LC_TIME", "French")
d=c("Dim Jan 27", "Jeu Jui 07")
d
d=as.Date(d,"%a %b %d")
d

Sys.setlocale("LC_TIME", "English")
d=c("Sun May 27", "Thu Jul 07")
d
d=as.Date(d,"%a %b %d")
d

Sys.getlocale(category = "LC_ALL")#para verificar en que idioma esta el sistema operativo

#INDEXACION Y OPERADORES LOGICOS PARA MATRICES

sqrt(2)
(2)^2
sqrt()