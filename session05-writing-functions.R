## writing functions
gDat  <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## compute difference between variable max and min
## practice with lifeExp, pop, gdpPercap

DIF_lifeExp=max(gDat$lifeExp)-min(gDat$lifeExp)
DIF_pop=max(gDat$pop)-min(gDat$pop)
DIF_gdpPercap=max(gDat$gdpPercap)-min(gDat$gdpPercap)

DIF2_lifeExp=range(gDat$lifeExp)[2]-range(gDat$lifeExp)[1]
DIF2_pop=range(gDat$pop)[2]-range(gDat$pop)[1]
diff(range(gDat$lifeExp))
gDat[which.min(gDat$lifeExp),]

## let's package in a function

max_minus_min <- function(x) max(x)-min(x)
max_minus_min(gDat$lifeExp)
max_minus_min(gDat$gdpPercap)
test_data <- randu[,1]
max_minus_min(test_data)

##quantile function

quantile(gDat$lifeExp, 0.25)
quantile(gDat$lifeExp, 0.75)
quantile(gDat$lifeExp, 0.95)
with(gDat, quantile(lifeExp, 0.25))

## use quantile 0.25 and 0.75, store and get difference max and min

max_min_quantile <- function(x,y,z) {abs((quantile(x,y))-(quantile(x,z)))}
max_min_quantile(gDat$lifeExp, 0.25, 0.75)
max_min_quantile <- function(x,y) {
  diff(range(quantile(x, probs = y)))
}
max_min_quantile(gDat$lifeExp, y  <- c(0.25, 0.50, 0.75))
max_min_quantile(gDat$lifeExp, c(0.25, 0.50, 0.75))

quantile_diff <- function(x, probs){
  the_quantiles <- quantile(x, probs = probs)
  return(max(the_quantiles) - min(the_quantiles))
}
quantile_diff(gDat$lifeExp, probs = c(.25,.75))
IQR(gDat$lifeExp)

quantile_diff <- function(x, probs = c(0,1)){
  the_quantiles <- quantile(x, probs = probs)
  return(max(the_quantiles) - min(the_quantiles))
}

quantile_diff(gDat$lifeExp)
