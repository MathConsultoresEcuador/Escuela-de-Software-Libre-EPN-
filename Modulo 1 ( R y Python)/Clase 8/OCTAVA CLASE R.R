library(MASS)
library(car)
library(ISLR)

lm.fit=lm(medv~lstat+age,data=Boston)
summary(lm.fit)

lm.fit=lm(medv~.,data=Boston)
summary(lm.fit) # Al poner el punto R entiende que se va a tomar todos los predictores de la base

# EL SIGUIENTE PASO ES QUITAR LAS VARIABLES NO SIGNIFICATIVAS
#Para encontrar R^2
summary(lm.fit)$r.sq
#RSE

summary(lm.fit)$sigma

#Factor de Inflación de la Varianza VIF

#Depende del paquete "car"

vif (lm.fit)

#COMO QUITAR LAS VARIABLES (se coloca menos en lugar de más)
#Regresión con todas las variables excepto age
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)

#TERMINOS DE INTERACCIÓN
#lstat*age ESTO HACE QUE EXISTA UN VARIABLE PARA "lstat" y otra para "age" 
#otra manera es escribiendo esto es "lstat + age + lstat: age" los (:) significa con que esta relacionando 
summary( lm( medv ~ lstat*age,  data=Boston ) )

#Transformaciones no lineales de los predictores

# es una forma de encontrar mejores predictores y esto se tiene añadiendo nuevas variables
#La funcion "lstat" no entiende directamente este simbolo(^) pero es mejor hacer una funcion para trabajar de mejor manera
lm.fit2 = lm( medv~lstat + I(lstat^2), data = Boston)
summary(lm.fit2)

# ahora para tomar una decisión para escojer "lstat" ó "lstat^2"
#Se realiza el siguiente análisis con la función "anova()"
#La función anova() realiza una prueba de hipótesis que compara los dos modelos.
#La hipótesis nula es que los dos modelos se ajustan a los datos igualmente bien, y la hipótesis alternativa
#es que el modelo completo es superior.
#el Pr(>F) tiene que ser menor que 0.05

#Gráficos de validación

#Cuando se incluye el término cuadrático lstat^2 hay un patrón poco discernible en los residuos.

par(mfrow=c(2,2)) 
plot(lm.fit2)
