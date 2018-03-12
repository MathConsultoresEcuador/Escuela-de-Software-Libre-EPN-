#TALLER
 url   = "https://raw.githubusercontent.com/jfzeac/analisis_datos_r/master/NCD_RisC_eLife_2016_height_age18_countries.csv"
datos = read.csv(url)
head(datos)

url2    = "https://raw.githubusercontent.com/jfzeac/analisis_datos_r/master/medidas_escolares.csv"
medidas = read.csv(url2)
head(medidas)

table(datos$Sex)

#La función subset(x, subset, select, drop = FALSE, ...) permite segmentar la base de datos. Por ejemplo,
#podemos segmentar a las mujeres de Ecuador y requerir solamente las variables Country, Sex, Year.of.birth 
#y Mean.height..cm.:

estat_mujeres = subset(datos, Sex=="Women" & Country=="Ecuador", select=c(Country, Sex, Year.of.birth, Mean.height..cm.))
head(estat_mujeres)

#RENOMBRAR COLUMNAS

colnames(estat_mujeres) = c("País", "Sexo", "Año_Nacim", "Estatura")
colnames(estat_mujeres)
#GRAFICO PARA VER COMO VA LA EVOLUCION DE LA ESTATURA EN MUJERES

plot(estat_mujeres$Año_Nacim, estat_mujeres$Estatura, pch = 20,
     xlab = "Año de nacimiento", ylab = "Estatura (cms)", 
     main = "Evolución de las estaturas de las mujeres (1896-1996)",
     col  = "cornflowerblue" )

#PARA HOMBRES Y MUJERES AL MISMO TIEMPO
estat = subset(datos, Country == "Ecuador",
               select = c(Country, Sex, Year.of.birth, Mean.height..cm.))
colnames(estat) = c("País", "Sexo", "Año_Nacim", "Estatura")
head(estat)
table(estat$Sexo)

#Gráfico comparativo de la evolución de las estatutaras de los ecuatorianos.
#Adicionalmente, lty define el tipo de lineas, lwd define el grosor de la 
#linea y cex define el tamaño de la leyenda:

plot(estat$Año_Nacim, estat$Estatura, pch = 20, xlab = "Año de nacimiento",
     ylab = "Estatura (cms)", main = "Evolución de las estaturas (1896-1996)", 
     type = "n")

points(estat$Año_Nacim[estat$Sexo == "Men"], estat$Estatura[estat$Sexo == "Men"], 
       col = "darkblue", pch = 18)

points(estat$Año_Nacim[estat$Sexo == "Women"], estat$Estatura[estat$Sexo == "Women"], 
       col = "pink", pch = 20)

legend(x=1960,y=150, 
       c("Hombre", "Mujer"), 
       lty=c(1,2), 
       lwd=c(2.5,2.5), 
       col=c("darkblue","pink"), 
       cex = 0.9)

#Diagrama de dispersión
#Correlación del peso y la estatura + regresión lineal.
cor(medidas$PESO, medidas$ESTATURA)
modelo = lm(ESTATURA ~ PESO, data = medidas)
plot(medidas$PESO, medidas$ESTATURA)
plot(medidas$PESO, medidas$ESTATURA, xlab = "Peso", ylab = "Estatura", pch = 20, 
     col = "darkblue")
abline(modelo, col = "red")

#EJERCICIOS
# 1.-Graficar unos boxplot por género de las
#estaturas de los niños de 14 años
table(medidas$EDA_DECI >= 14  & medidas$EDA_DECI < 15 )
niños14 = subset(medidas, 14 <= EDA_DECI  & EDA_DECI < 15,
                 select = c(ID, SEXO, ESTATURA ))
head(niños14)

#Boxplot de todos los niños

boxplot(niños14$ESTATURA, col = "darkgreen", ylab = "Estatura (cm)",
        main = "Diagrama de caja estatura de niños de 14 años", pch = 20)

#Boxplot por sexo

boxplot( niños14$ESTATURA ~ niños14$SEXO , 
         col = c("pink", "darkblue"),
         ylab = "Estatura (cm)",
         main = "Diagrama de caja estatura de niños de 14 años",
         pch = 20)

#Diagrama de caja y jitter

#Jitter hace referencia la inclusión de los individuos en el boxplot.

boxplot(niños14$ESTATURA ~ niños14$SEXO , col = c("pink", "darkblue"),
        ylab = "Estatura (cm)",
        main = "Diagrama de caja estatura de niños de 14 años", pch = 20)

stripchart(niños14$ESTATURA ~ niños14$SEXO, vertical = TRUE, 
           method = "jitter", add = TRUE, pch = 20, col = 'red')

#Ejercicio de histograma para las estaturas de los niños y niñas
summary(medidas$EDA_DECI)

#La opción xaxt es el tipo de eje, con n se suprime el eje x.

#Con la función axis(side = 1) se construye el nuevo eje x,
#en at se indican los valores a identificar sobre dicho eje.

hist(medidas$EDA_DECI, xlab = "Edad", ylab = "Frecuencia",
     main = "Histograma de Edades", col = "red",
     xaxt="n" )

axis(side = 1, at=seq(4, 20, by=2))

#Histograma y gráfico de densidad (aproximada)

hist(medidas$EDA_DECI, xlab = "Edad", ylab = "Densidad", main = "", col = "plum",
     xaxt="n", prob = TRUE )
axis(side = 1, at=seq(4, 20, by=2))
lines(density(medidas$EDA_DECI), col = "blue")

#2.-Hacer un gráfico de barras del sexo en la institución educativa
tf_sexo = table(medidas$SEXO)
tf_sexo
barplot(tf_sexo)
barplot(tf_sexo, main="Frecuencias absolutas sexo", 
        xlab="Sexo", ylab = "Frecuencias absolutas",  
        space = 0.5, col = c("pink", "blue"), ylim = c(0, 5000))
barplot(tf_sexo, main="Frecuencias absolutas sexo", 
        xlab="Sexo", ylab = "Frecuencias absolutas", space = 0.5, col = c("pink", "blue"), ylim = c(0, 5000),
        yaxt="n")

axis(side = 2, at=seq(0, 5000, by=500))

#Tabla de frecuencias relativas (%)

tfr_sexo = prop.table(tf_sexo) * 100
tfr_sexo
barplot(tfr_sexo, main="Frecuencias absolutas sexo", 
        xlab="Sexo", ylab = "Frecuencias relativas (%)", 
        space = 0.5, col = c("pink", "blue"), ylim = c(0, 100),
        yaxt="n")
axis(side = 2, at=seq(0, 100, by=10))

#Gráfico de barras apilado de ciudad y sexo
tf_CS = table(medidas$COD_CIUDAD, medidas$SEXO)
tf_CS
barplot( tf_CS)

#PARA PONER COLOR A CADA CORTE Y LEYENDA

barplot( tf_CS, xlab = "Sexo", ylab = "Frecuencias absolutas", 
         col = rainbow(8))
legend("topright", legend = rownames(tf_CS),
       fill = rainbow(8), cex=0.8, title = "Ciudad" )

#Diagrama de barras agrupados
barplot( tf_CS, xlab = "Sexo", ylab = "Frecuencias absolutas", 
         col = c("pink", "blue"), beside = T) 

legend("topright", legend = rownames(tf_CS),fill = c("pink", "blue"), 
       cex=0.8, title = "Sexo" )
