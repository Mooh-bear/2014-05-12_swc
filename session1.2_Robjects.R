## session 1.2 R objects
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)
head(gDat)
head(gDat, n =10)
tail(gDat, n=10)
names(gDat)
dim(gDat)
nrow(gDat)
ncol(gDat)
length(gDat)
summary(gDat)




plot(lifeExp~year, data=gDat)
plot(lifeExp~gdpPercap, data=gDat)
gDat$lifeExp
summary(gDat$lifeExp)
hist(gDat$lifeExp)
hist(gDat$gdpPercap)
gDat$continent

##subset
subset(gDat, subset=country == "Cambodia")
subset(gDat, subset=country %in% c("Cambodia", "Japan", "Spain"))
subset(gDat, subset=year < 1962)

##exercise
## subset lifexp <32
subset(gDat, subset=lifeExp < 32)
subset(gDat, subset=lifeExp < 32, select=c(country, lifeExp, pop))
myData  <- subset(gDat, subset=lifeExp < 32, select=c(country, lifeExp, pop))
plot(data=gDat, lifeExp~year, subset=country=="Spain")
lm(data=gDat, lifeExp~year, subset=country=="Canada")
with(gDat, mean(lifeExp))
with(subset(gDat, subset=country=="Canada"), mean(lifeExp))

##
x  <- 5
x
x <- c(3,5)
x
x[3] <- 4
x
x <- c(1,2,3,4,5,6)
x^2
x  <- c(1,3, "cabbage")
class(x)
##
x <- c(1,2,3)
x <- rnorm(10);x
x <- x<0 ;x
x <- cbind(1:5, c("a","b","c","d","e"))
x
x[3,]
x[,1]
x[3,2]
