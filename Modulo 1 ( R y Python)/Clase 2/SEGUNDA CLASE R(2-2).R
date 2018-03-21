#INDEXACION Y OPERADORES LOGICOS PARA MATRICES
sqrt(2)
(2)^2
sqrt(2)^2
x=c('david'=2,'belen'= 4.1,'carlo'= 0.5, 1.8, 0.43, 0.03, 12, 2.8)# termino a termino
x
y=sqrt(x)
y
x-y
x>y
x[x>y]#indexación "[]" es filtrar dar una condición especifica.
(A=cbind(x, y, x>y) ) #cbind()para transformar lo que esta fila a columna
#cuando quiero concatenar varios elementos la forma correcta es
x[c(2,3,4)]
x[2:4]

x[c(3,5,6)]
x[c(3,5,6)]*2
x[c(3,5,6)]=x[c(3,5,6)]*2 #para sustituir/redefinir la base de un vector
x

#CREAR LOS VECTORES X y Y
x=c(2.3, -1.2, -9.8, 3.5, 8.1, 3.4)
y=c(-4.5, 3.0, 2.4, 8.2, -1.9, -9.1)
#concatenar los valores
xy=c(x,y)
xy
#extraer los elementos de los resultante que ocupan los lugares 1,8,10 y 13
xy[c(1,8,10,13)]
length(xy)
#extraer los elementos de x que sean negativos o mayores que 4
x[x<0 | x>4] # o lo uno o lo otro
x[x<0 & x>4]

#sustituir todos los elementos de x, menos el primero y el ultimo, por el valor de 0
length(x)
x
x[2:5]
x[2:5]=0
x
#Poner las 6 primeras letras del abecedario como nombres de las componentes del vector y
#sustituir por -3.2 la componente de y cuyo nombre es "E"
y
names(y)
letters #esta funcion viene cargado de las letras del abecedario anglosajon
names(y)=letters[1:6]
y
names(y)
y[names(y)=="e"]#== es para evaluar
y[names(y)=="e"]=-3.2
y

#CREAR UNA MATRIZ DE CUATRO MANERAS DIFERENTES byrow=TRUE

matrizA=matrix(c(1, 20, 2, 30, 3, 40, 4, 50, 5, 60), byrow=TRUE, ncol=2)
matrizA
#cbind= pegar columnas 
#rbind=pegar filas
A1=c(1, 2, 3, 4, 5)
A2=c(20, 30, 40, 50, 60)
matrizA=cbind(A1, A2)
matrizA
is.matrix(matrizA)#cuando concatenamos dos vectores es una matriz la funcion is es una pregunta

A1=c(1, 2, 3, 4, 5)
A2=c(20, 30, 40, 50, 60)
matrizA=rbind(A1, A2)
matrizA
is.matrix(matrizA)

#una vez creada la matriz poner a las filas los nombres F1, F2,F3,F4,F5 y a las colunmas
#C1, C2. utilice las funciones rownames y colnames

matrizB=matrix(c(1, 20, 2, 30, 3, 40, 4, 50, 5, 60), byrow=TRUE, ncol=2)
matrizB
colnames(matrizB)
rownames(matrizB)
colnames(matrizB)=c("C1","C2")#siempre con la concatenacion
rownames(matrizB)=c("F1","F2", "F3", "F4","F5")
matrizB

#extraer la matriz formada por los valores que estan en las dos primeras filas
#y las dos prieras columnas de la matriz original
matrizB[1:2,1:2]
matrizB[c(1,3,4),c(1,2)]
#Extraer la segunda columna de la matriz sin perder la dimension, esto es, poner la columna de la matriz como una 
#matriz de cuatro filas y una columna
matrizB[2,]
cbind(matrizB[,2])
matrizB
matrizB[matrizB>2]#cuando no pongo la coma se hace para toda la matriz
matrizB[matrizB>2]=matrizB[matrizB>2]*2
matrizB
