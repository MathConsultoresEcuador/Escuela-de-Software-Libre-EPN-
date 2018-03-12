3+3+5 #run
4*5 # control-enter otra manera para hacer que corra el código 
a=(5+8)*4/83 # el resultado se guardo en un objeto llamado a es el nombre 
a # control-enter para ver el valor de la operación anterior 

#CREE EL VECTOR CON LAS SIGUIENTES ENTRADAS:1,5,7,9
a=c(1, 5, 7, 9) #la letra c viene de concatenar es una caracteristica de un vector y siempre comas
a
length(a) #para ver la cantidad de elementos del vector
class(a) #para ver la clase de vector(numerico,caracteres...)}
dim(a) #no trabaja con vectores
summary(a)

#CREE EL VECTOR CON LAS SIGUIENTES ENTRADAS: b=c("juan", "jose")
b=c("juan", "jose", "pedro", "gabriel")#siempre usar comillas para los caracteres texto
b
length(b)
class(b)
summary(b)
#CREE EL VECTOR MIXTO
c=c("juan","jose", "pedro", 4)
c
length(c)
class(c)
dim(c)
summary(c)

#CREE EL VECTOR CON LAS SIGUIENTES ENTRADAS: d=c(T,F,T,T,F)
d=c(T,F,T,T,F)# T y F reservados para operadores logicos
d
length(d)
class(d)
summary(d)

#CREE EL VECTOR CON LAS SIGUIENTES ENTRADAS: d=c(T,F,"T",T,F)
d=c(T,F,5,T,F)# T y F reservados para operadores logicos
d
length(d)
class(d)
summary(d)
#CREE EL VECTOR CON LAS SIGUIENTES ENTRADAS: d=c(T,5,T,T,F)
d=c(T,5,T,T,F)# T y F reservados para operadores logicos
d
length(d)
class(d)
summary(d)

#CREE EL VECTOR CON LAS SIGUIENTES ENTRADAS: d=c(T,5,"T",T,F)
d=c(T,5,"T",T,F)# T y F reservados para operadores logicos
d
length(d)
class(d)
summary(d)

#MATRICES
matriz= matrix(data = c(1:5, 18, 21, 34,25, 28), nrow = 5, ncol = 2)
matriz
length(matriz)
dim(matriz)
#FORMA ALTERNATIVA DE CREAR ESA MATRIZ
matriz2= matrix( c(1, 18,2, 21, 3, 34, 4, 25, 5, 28), byrow = T, ncol = 2)
matriz2
length(matriz2)
dim(matriz2)

matriz3= matrix( c(1, 18,2, 21, 3, 34, 4, 25), byrow = F, ncol = 2)
matriz3
length(matriz3)
dim(matriz3)

matriz4= matrix( c(1, 18,2, 21, 3, 34, 4, 25, 5, 28),  ncol = 2)
matriz4
length(matriz4)
dim(matriz4)
class(matriz4)
typeof(matriz4)
summary(matriz4)

m= matrix( c("ID1", "ID2","ID3", "ID4", "ID5", "M", "F","M", "F","M"), nrow = 5, ncol = 2)
m
length(m)
dim(m)

m2= matrix( c(paste0(c("IDa",'IDb'), 1:5), "M", "F","M", "F","M"),  ncol = 2)
m2
length(m2)
dim(m2)

paste0("ID", 1:5)
paste0("ID", sep=" * ", 1:5)
typeof(m)
summary(m)

n= matrix( c(1, 2, 3, 4, 5 , "M", "F","M", "F","M"), nrow = 5, ncol = 2)
n
length(n)
dim(n)
typeof(n)
class(n)
summary(n)


A= matrix( c(1, 2, 3, 4, 5 , 18, 21, 34, 25, 28), nrow = 5, ncol = 2)
A
length(A)
dim(A)
typeof(A)
class(A)
summary(A)

B=as.numeric(A)#extraer el vector numerico
B
length(B)
class(B)


