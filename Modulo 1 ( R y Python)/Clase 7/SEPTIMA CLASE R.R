#LANZAMIENTO DE MONEDAS
moneda=c("Cara", "Sello")
exp1=sample(moneda, 10, replace = T)
exp1

#para contar el numero de caras y sellos, utilizamos la funcion table
table(exp1)

prop.table(table(exp1))
exp2=sample(moneda, 1000000, replace= T)
            
exp2
table(exp2)            
prop.table(table(exp2))

#Regresion lineal : que comportamiento tiene un modelo
#siempre es lineal

library(MASS)
dim(Boston)#observaciones 506 y variables 14
str(Boston)#esta funcion nos permite ver que tipo de base de datos es y sus variables
#recordemos que para llamar una variable de una base de datos siempre se debe hacer de esta manera
#"nombre de la base de datos precedido por el signo de dolar "$" subsiguiente la variable"
head(Boston)
#ahora recordemos que para cambiar el tipo de dato tenemos que "nombre de la base de datos$var=factor(BD$var)

attach(Boston)#esta funcion permite decir a R que los datos que vamos a utilizar en el futuro es de esta base de datos
#Nota importante antes de usar esta opción debemos hacer todos los cambios necesarios  

#COMANDOS PARA LA REGRESIÓN
lm.fit=lm(medv~lstat) #esto se utiliza por la funcion "attach"
#ahora sin "attach"
lm.fit=lm(medv~lstat, data=Boston)
lm.fit #nos da los valores de los coeficientes
summary(lm.fit) #para obtener mas información
names(lm.fit)

#Coeficientes
lm.fit$coefficients
#residuos
cbind(head(lm.fit$residuals))

#valores ajustados " predicciones"
cbind(head(lm.fit$fitted.values))

#INTERVALOS DE CONFIANZA "en este intervalo esta el valor real"
confint(lm.fit, level = 0.95)

# el nivel de confianza entre mas cercano a uno mas grande es el intervalo
#Es conveniente tomar un nivel de confianza mas pequeño, pero claro que al tomar un neviel de confianza
#de 0.99 tendemos a no cometer errores
confint(lm.fit, level = 0.99)

#PREDICCIONES

predict(lm.fit, data.frame(lstat=c(5, 10, 15)))

predict(lm.fit, data.frame(lstat=c(5, 12, 15)))

#para tener un intervalo 
predict(lm.fit, data.frame(lstat=c(5, 10, 15)), interval = "prediction", level = 0.95)

predict(lm.fit, data.frame(lstat=c(5, 10, 15)), interval = "prediction", level = 0.99)

#GRAFICOS DE REGRESION LINEAL SIMPLE
plot(lstat, medv, main = "Precios viviendas vs. porcentaje de poblacion de clase baja",
     abline(lm.fit, lwd=3, col="red")) # la funcion abline es para hacer la linea


#para retirar el attach
detach(Boston)
