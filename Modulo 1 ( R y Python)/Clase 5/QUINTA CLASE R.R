#HISTOGRAMAS barras unidas

x=c(6.9, 6.2, 5.4, 4.7, 4.8, 6.0, 6.3, 5.0, 4.5, 6.3, 5.9, 6.7,
    6.1, 5.0, 6.7, 5.8, 6.1,5.7, 5.2, 4.6)
x
hist(x)

#En R los intervalos(categorias) para los histogramas se calculan usando los siguientes metodos 
#Sturges
hist(x, breaks = "Sturges") #breaks es para dar las especificaciones

#Scott
hist(x, breaks = "Scott")

#Freedman-Diaconis
hist(x, breaks = "FD")
#Para personalizar los graficos 
#COLORES
hist(x, col="orange")#para ver los colores que posee R descargar de colors r
hist(x, col="coral3")
hist(x, col="3")
hist(x, col="lightpink1")

#ETIQUETAS
#es posible usar los argumentos main, xlab e ylab para modificar el titulo y el nombre de los ejes
hist(x, col = "khaki", main = "MI HISTOGRAMA", xlab = "Intervalos de clase", ylab = "Frecuencia")

#Bar charts(graficos de barras) las barras separadas 
#para ver los diagramas de barras (barplots), usaremos tablas de contingencia(conteo)
#o tablas de frecuencia relativa(proporcion). La base de datos "mtcars"
#barrplot toma como referencia tablas de conteo es decir table ó prop.table
mtcars
table(mtcars$gear)#terminos absolutos
prop.table(table(mtcars$gear))#terminos relativos para ver porcentajes 
barplot(table(mtcars$gear), main = "Distribucion de vehiculos", xlab = "Numero de marchas", ylim = c(0,16))
barplot(prop.table(table(mtcars$gear)), main = "Distribucion de vehiculos", xlab = "Numero de marchas", ylim = c(0,0.6))
#Como poner etiqueta a las barritas
barplot(table(mtcars$gear), main = "Distribucion de vehiculos", horiz = TRUE, names.arg = c("3 marchas", "4 marchas", "5 marchas"), col="pink")
#name.arg= es para dar los nombres a cada barra

#BARRAS APILADAS: ES PARA RELACIONAR DOS VARIABLES  hacer una tabla de conteo
counts=table(mtcars$vs, mtcars$gear)
counts
barplot(counts, main = "distribucion de vehiculos para marchas y VS", xlab = "numero de marchas",
        col = c("darkblue", "red"), legend=rownames(counts), ylim = c(0,16))
# para comparar las barras
barplot(counts, main = "distribucion de vehiculos para marchas y VS", xlab = "numero de marchas",
        col = c("darkblue", "red"), legend=rownames(counts), ylim = c(0,16), beside = T)
#beside para poner la barra alado y poder comparar


#SCATTERPLOTS
# ES UNA FUNCION CATEGORICA GRAFICOS DE DISPERSION
#plot(x, y, main, xlab, ylab, xlim, ylim, axes) x, y son vectores
input=mtcars[, c("wt", "mpg")]
head(input)# nos deja ver solo las 6 primeras filas de la base
plot(x=input$wt, y=input$mpg)
plot(x=input$wt, y=input$mpg, xlab = "Peso/Weight", ylab = "Millas/Millage", xlim = c(2.5,5),
     ylim = c(15,30), main = "Peso vs Millas", col=c("red","black"))
abline(lm(mpg~wt, data = input), col="orange")#es para la regresion lineal 

#PARA VARIOS GRAFICOS

pairs(mtcars)#esta funcion define para cada grafico los x e y

#BOXPLOT (DATO DE TIPO NUMERICO CON LOS CATEGORICOS)
z=iris[, "Sepal.Width"]
boxplot(z) #medidas de precision
# la funcion par() determina ciertos comandos graficos es una funcion global
par(mfrow=c(2,1))
boxplot(z, horizontal = T, ylim=c(2, 4.5))
hist(z)

par(mfrow=c(1,2))
boxplot(z, horizontal = F, ylim=c(2, 4.5))
hist(z)

par(mfrow=c(1,1))

boxplot(iris$Sepal.Length ~ iris$Species)#~ indica relacion algo con algo
boxplot(iris$Sepal.Length ~ iris$Species, horizontal= T, border=c("pink", "black", "red"), col=c("red","blue", "yellow"))

#pie charts (grafico de pastel)
#x es un vector numerico no numerico
#labels= anota un vector de caracteres de los nombres para los sectores
slices=c(10, 12, 4, 16, 8)
lbls=c("US", "UK", "AUSTRALIA", "GERMANY", "FRANCE")
pie(slices, labels = lbls, main = "pie charts of countries")

#AHORA DEBEMOS MEJORARLOS

slices=c(10, 12, 4, 16, 8)
lbls=c("US", "UK", "AUSTRALIA", "GERMANY", "FRANCE")
pct=round(slices/sum(slices)*100)
lbls=paste(lbls, pct)
lbls=paste(lbls,"%", sep = "-")
pie(slices, labels = lbls, col = rainbow(length(lbls)), main = "Pie Chart of Countries")
rainbow(4)
