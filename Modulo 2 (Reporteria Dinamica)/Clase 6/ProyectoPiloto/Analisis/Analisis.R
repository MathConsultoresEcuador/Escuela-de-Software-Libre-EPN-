# Análisis de Datos depurados ---------
getwd()
#Ejemplo Modelo Regresion -----
cars = cars
plot(cars)

set.seed(1) #Fijar semilla para simulación
cars$`Belén` = 2*cars$dist + (cars$speed)^2 + rnorm(dim(cars)[1],sd=2)
cars
plot(cars)

#Regresion Simple ---------
modelo1 = lm(data=cars, `Belén` ~ dist)
summary(modelo1)

par(mfrow=c(2,3))
plot(modelo1,1:6)

#Regresion Multiple --------
modelo2 = lm(data=cars, `Belén` ~ dist + speed)
summary(modelo2)

par(mfrow=c(2,3))
plot(modelo2,1:6)

#Regresion Multiple (no lineal en la forma funcional)----
modelo3 = lm(data=cars, `Belén` ~ dist + I(speed^2))
summary(modelo3)

par(mfrow=c(2,3))
plot(modelo3,1:6)

#Quitar valores atipicos o puntos palanca -------
cars_limpio = cars[-c(24,35,39),]
cars_limpio

modelo4 = lm(data = cars_limpio, `Belén` ~ dist + I(speed^2))
summary(modelo4)
anova(modelo4)
par(mfrow=c(2,3))
plot(modelo4,1:6)

save(cars,cars_limpio,modelo1,modelo2,modelo3,modelo4,
     file="Analisis/Modelos.RData")






