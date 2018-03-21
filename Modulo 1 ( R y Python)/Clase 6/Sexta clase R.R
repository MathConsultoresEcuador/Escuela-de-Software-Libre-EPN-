#histogramas con geom_histogram
#descargar el paquete ggplot2
#con la funcion ggplot2, vamos a generar un histograma con la medicion de la densidad
library(ggplot2)
ggplot(data=iris, aes(x=iris$Sepal.Length))+ #aes es mi eje 
  geom_histogram(aes(y=..density..), col="red")+
  xlab("Rango de valores")+
  ylab("Frecuencia Relativa")+
  ggtitle("Histograma")

head(diamonds)

ggplot(diamonds, aes(price)) + # el (+) es para unir y bins para el numero de barras 
  geom_histogram(bins=30)

ggplot(diamonds, aes(price)) + 
  geom_histogram(bins = 9999)         

ggplot(diamonds, aes(price)) + geom_histogram(bins = 30)

ggplot(diamonds, aes(price, fill = cut)) +# fill: llenar tipo categorica o factor no numeros
  geom_histogram(position = "stack",bins =30) # stack. apilar

#EJEMPLO
df1 <- data.frame(cond = factor( rep(c("A","B"), each=200) ), 
                  rating = c(rnorm(200),rnorm(200, mean=.8)))

df2 <- data.frame(x=c(.5,1),cond=factor(c("A","B")))

ggplot(df1, aes(x=rating, fill=cond)) + 
  geom_histogram(binwidth=.5, position="dodge") +
  geom_vline(data=df2,aes(xintercept=x,linetype=factor(cond)),
             show_guide=TRUE) +
  labs(fill='Stochastic',linetype='Deterministic')

m = ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_point() +# ESTA FUNCION HACE LOS GRAFICOS DE DISPERSION
  xlim(0.5, 6) +
  ylim(40, 110)

m + geom_density_2d()

#AQUI VAMOS A CREAR NUESTRAS BASES
months   <- rep(c("jan", "feb", "mar", "apr", "may", "jun", 
                  "jul", "aug", "sep", "oct", "nov", "dec"), 2)
chickens <- c(1, 2, 3, 3, 3, 4, 5, 4, 3, 4, 2, 2)

eggs     <- c(0, 8, 10, 13, 16, 20, 25, 20, 18, 16, 10, 8)
values   <- c(chickens, eggs)
type     <- c(rep("chickens", 12), rep("eggs", 12))
mydata   <- data.frame(months, values)
mydata
ggplot(mydata, aes(months, values))+
  geom_bar(stat = "identity") # bar: es como cada dato se lle uno a uno
#hay que cambiar los datos a tipo factor(categoricos) par poder ordenar

mydata$months <-factor(mydata$months, 
                       levels = c("jan", "feb", "mar", "apr", "may", "jun",
                                  "jul", "aug", "sep", "oct", "nov", "dec"))

ggplot(mydata, aes(months, values))+
  geom_bar(stat = "identity", aes(fill = type))

ggplot(mydata, aes(months, values))+
  geom_bar(stat = "identity", aes(fill = type), position = "dodge") # con la funcion position = "dodge" es para que no este apilada

#para quitar el fondo predeterminado

ggplot(mydata, aes(months, values))+
  geom_bar(stat = "identity", aes(fill = type), position = "dodge") +
  xlab("Months") + ylab("Count") +
  ggtitle("Chickens & Eggs") +
  theme_bw()# es la funcion de cambio de fondo

#SCATTERPLOTS

data <- LifeCycleSavings[1:10, ]
data

qplot(dpi, sr, data = data)+ #qplot es una funcion para graficos de dispersión
theme_bw()
# para etiquetar cada punto

ggplot(data, aes(x = dpi, y = sr, label = rownames(data)))+
  geom_point() + #la funcion geom_point es equivalente a qplot
  geom_text(vjust = 1.5) # esta función es para el texto ( tamaño)

#Boxplot se realiza un resumen

head(ToothGrowth)
ggplot(ToothGrowth,aes(supp,len)) + 
  geom_boxplot(aes(fill=supp))

ggplot(ToothGrowth,aes(supp,len)) + 
  geom_boxplot(aes(fill=supp))+ geom_point()
# PARA CAMBIAR EL ORDEN 
ggplot(ToothGrowth,aes(factor(dose),len)) +
  geom_boxplot(aes(fill=factor(dose)))

#Heat map
df = expand.grid(teams = c("Team A", "Team B", "Team C", "Team D")
                 ,metrics = c("Metric 1", "Metric 2", "Metric 3", "Metric 4", "Metric 5")
)
df

set.seed(41)
df$performance = rnorm(nrow(df))
head(df)

ggplot(data = df, aes(x = metrics, y = teams))+
  geom_tile(aes(fill = performance))+# aes siempre para dar una variable
  scale_fill_gradient(low = "pink", high = "black")

#ESTADISTICA DESCRIPTIVA

#1.-MEDIDASDE TENDENCIA CENTRAL
#PROMEDIO
y=rnorm(25000, 25, 5)#rnorm es una funcion que nos da datos aleatorios 250 numero de datos, 25 la media, 5 desviacion estandar
media=mean(y)
media


#MEDIANA
mediana=median(y)
mediana

# En R no existe una funcion especifica para la moda. Así que nosotros lo vamos a crear manualmente
#moda
a=c(1:20, 5:10, 7)
a

table(a)

#sort: es una funcion PARA ordenar( que voy ordenar y como lo voy a ordenar)
sort(table(a), decreasing = T)
head(sort(table(a),decreasing = T))
head(sort(table(a),decreasing = T), n=3)

# el rango medio
rango.medio=(max(y)+min(y))/2
rango.medio

rbind(media, mediana, rango.medio)

#2.- MEDIDAS DE DISPERSION
#El rango
rango=max(y)-min(y)
rango

#la varianza
varianza=var(y)
varianza
sqrt(var(y))
desv.est=sd(y)
desv.est

#El coeficiente de variación
coef.var=desv.est/media*100
coef.var
#resumen con rbind()

rbind(rango, varianza, desv.est, coef.var)

#3.-MEDIDAS DE POSICIÓN

#PERCENTIL: se unsa la funcion de quantile
quantile(y)
rbind(quantile(y))
cbind(quantile(y))

#para obtener el quintil 2, p=0.40
quantile(y, 0.40)

# de valor a percentil ( en que posicion cae)

y<26.13

head(cbind(y, condición=y<26.13))

#la funcion mean me revela en que posicion esta esta condicion
mean(y<26.13)*100
#otra forma de realizarlo
sum(y<26.13)/length(y)*100

#4.-MEDIDAS DE FORMA
 library(PerformanceAnalytics)

#el coeficiente de asimetria se clacula de esta manera
asimetria=skewness(y, method = c("sample"))
asimetria
#el exceso de curtosis se cálcula con
curtosis=kurtosis(y, method = "sample_excess")
curtosis

rbind(asimetria, curtosis)

#5.- MUESTREO ALEATORIO SIMPLE
#teniendo en cuenta la base de datos de iris
indices=sample(1:nrow(iris), 60)#sample (muestra) muestreo sin reemplazo
length(indices)
length(iris)
dim(iris)
class(indices)
iris2=iris[indices, ]
table(iris$Species)
table(iris2$Species)
indices=sample(1:nrow(iris), 60, replace = TRUE)#replace es cuando se tiene reemplazo
iris[indices,]

#MUESTREO ALEATORIO ESTRIFICADO
library(sampling)
estratos=strata(iris, stratanames = c("Species"), size = c(20,20,20), method = "srswor") 
class(estratos)
head(estratos)
iris.muestreado=getdata(iris, estratos)#la funcion getdata es para segmentar
iris.muestreado
