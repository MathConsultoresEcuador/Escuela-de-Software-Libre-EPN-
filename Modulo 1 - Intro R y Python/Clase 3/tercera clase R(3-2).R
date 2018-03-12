#CREAR NUESTRAS FUNCIONES PROPIAS
#Loops (bucles) existen tres tipos es hacer una tarea de formarepetitiva
#for loops lo que va cambiando de columna a columna
#EJEMPLO 1
for (i in 1:4) {
  print(i^2)
}

#EJEMPLO 2
#La funcion cat(para texto) concatena elementos y los imprime. Dentro de la funcion en el texto 
#\n equivale a un salto de linea
for (i in 1:5) {
  cat("\n La letra i toma el valor de", i)
}

#while loops :mientras la condicion sea verdadera
#valor inicial: siempre definir
x=1
#while loops
while(x<5){
  print(x)
  x=x+1
}

#EJERCICIO 2
#VALOR INICIAL index
index=1

#while Loops
while (index<6) {
  cat("\n El valor de index pasa de", index)
  index=index+1
  cat(" a", index)
}

#repeat loops: parecido al while pero en otra estructura (do-while)
#valor inicial
x=1
#repeat loop
repeat{
  print(x)
  x=x+1
  if(x==6){break} #break es como cancelar
}

#LA FUNCION if.SI
#EJEMPLO 1
x=5
if(x>0){
  print("NUMEROS POSITIVO")
}

#LA FUNCION IFELSE:sino
#ifelse(test, yes, no)
#EJEMPLO 1
x=1:10
ifelse(x<5, "cumple", "no cumple")
cbind(x, test=ifelse(x<5, "cumple", "no cumple"))

#EJEMPLO 2
 y=seq(0,20,2)#para hacer una secuencia de forma refinada 
 #valor inicial, valor final, condicion
 y
 
 condicion1= y<7 | y>=18
 condicion1
cbind(y, test=ifelse(condicion1, "cumple", "no cumple")) 

#funcion if... else anidada
#EJEMPLO
x=0
if(x<0){
  print("numero negativo")
}else if(x>0){
  print("numero positivo")
}else{
  print("cero")
}

x=-5
if(x<0){
  print("numero negativo")
}else if(x>0){
  print("numero positivo")
}else{
  print("cero")
}

x=6
if(x<0){
  print("numero negativo")
}else if(x>0){
  print("numero positivo")
}else{
  print("cero")
}

#Funciones personalizadas
#ejemplo
suma.uno=function(x){
  resultado=x+1
  return(resultado)
}
suma.uno(15)

multiplicacion.cinco=function(y){
  resultado=y*5
  return(resultado)
}
multiplicacion.cinco(20)

#EJEMPLO 2
holamundo=function(nombre="Fernanda"){
  cat("Hola", nombre)
}
holamundo()
holamundo(nombre = "Migue..")
holamundo("Karen")

#EJERCICIO EN CLASE
signo.numero=function(x){
  if(x<0){
    print("numero negativo")
  }else if(x>0){
    print("numero positivo")
  }else{
    print("cero")
  }
}

signo.numero(7)
signo.numero(0)
signo.numero(-4)
ifelse(x<0, "numero negativo", ifelse(x>0, "numero positivo", "cero"))#para vectores
numero.signo=function(x){
  ifelse(x<0, "numero negativo", ifelse(x>0, "numero positivo", "cero"))
}
numero.signo(c(2,-5,0))
for (i in -1:1) {
  signo.numero(i)#puedo utilizar la funcion cuando ya la tengo creada
  
}
for (i in -1:1) {
 
  if(i<0){
    print("numero negativo")
  }else if(i>0){
    print("numero positivo")
  }else{
    print("cero")
  }
}
 for(i in c(-5, 2, 0)){
   signo.numero(i)
 }
coef.varianza=function(x){#aqui x puede ser un numero o un vector
  theta=sd(x)
  media=mean(x)
  cv=theta/media
  return(cv)
}
coef.varianza(10)
coef.varianza(c(2,5))
coef.varianza(1:10)

coef.varianza2=function(x){#aqui x puede ser un numero o un vector
  cv=sd(x)/mean(x)
  return(cv)
  
}
coef.varianza2(1:5)
coef.varianza(rnorm(1000))#rnorm para hacer numeros aleatorios en rango de la normal

#INGRESAR DIFERENTES DATOS A r
#IMPORTAR DATOS CON R
#la primera funcion es read.table(): es la mejor opcion para leer archivos .txt
# read.table("<NombreArchivo>.txt", header=TRUE, sep=" ", dec=".")
read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt", header=FALSE, sep="", dec=".")

