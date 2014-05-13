## data aggregation
gDat  <- read.delim("gapminderDataFiveYear.txt")

## take a data frame
## linear regression of lifeExp~year
## return intercept and slope

lm(lifeExp ~ year, gDat)


library(ggplot2)
ggplot(gDat, aes(x = year, y = lifeExp)) + geom_point() +
  geom_smooth(method = "lm")

lm(lifeExp ~ I(year -1952), gDat)
fit <- lm(lifeExp ~ I(year -1952), gDat)
str(fit)
summary(fit)
coef(fit)
str(coef(fit))

## write a funtion input dataframe output intercept and slope
Intercept_slope <- function (x, y, z){
  fit <- lm(y ~ I(z - 1952), x)
  return(coef(fit))
}
Intercept_slope(gDat, lifeExp, year)

jfun <- function(df){
  fit <- lm(lifeExp ~ I(year - 1952), df)
  return(coef(fit))
}
jfun(gDat)

## create a subset for 1 country
## run jfun

gDat_canada <- subset(gDat, country == "Canada")
jfun(gDat_canada)
jfun(subset(gDat, country == "Canada"))

ggplot(gDat_canada, aes(x = year, y = lifeExp)) + geom_point() +
  geom_smooth(method = "lm")

library(plyr)
ddply(gDat, ~ country + continent, jfun)
