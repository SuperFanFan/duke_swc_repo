## useful bit at beginning of block03
gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)

## don't store copies of little bits of your data.frame like this unless you
## have good reason
(snippet <- subset(gDat, country == "Cambodia"))

## do you want to make plots for each value of a factor? then use multi-panel
## conditioning in lattice or facetting in ggplot2
library(lattice)
xyplot(lifeExp ~ year | country, gDat,
       subset = continent == "Oceania")

## let's begin with the data aggregation functions built-in to R

## let's begin with a function that operates on a matrix (or higher dimensional
## arrays, actually)
## first, we must create a sensible matrix from some of the Gapminder data
(jCountries <-c("Canada", "Cambodia", "Rwanda"))
tinyDat <- subset(gDat, country %in% jCountries)
str(tinyDat)
matrix(tinyDat$lifeExp,ncol=length(jCountries))

## safety first! making sure jCountries is in same
## order as the countries appear in tinyDat (and, therefore, gDat)
## important when we apply column names below
(jCountries <- as.character(sort(unique(tinyDat$country))))
tinyDat <- matrix(tinyDat$lifeExp, ncol = length(jCountries))
colnames(tinyDat) <- jCountries
rownames(tinyDat) <- sort(unique(gDat$year))
tinyDat

apply(tinyDat, 1, FUN=median)
apply(tinyDat, 1, FUN=summary)
apply(tinyDat, 2, FUN=max)
apply(tinyDat, 1, function(x) {c(mean=mean(x),sd=sd(x))})

rowMeans(tinyDat)
colMeans(tinyDat)
which.min(tinyDat["1957", ])
apply(tinyDat, 1, which.min)
colnames(tinyDat)[apply(tinyDat, 1, which.min)]

sapply(gDat, summary)
sapply(gDat, is.numeric
gDatNum <- subset(gDat,select=sapply(gDat, is.numeric))
str(gDatNum)
sapply(gDatNum, range)
lapply(gDatNum, range)
tapply(gDat$lifeExp,gDat$continent,max)
by(gDat$lifeExp,gDat$continent,FUN=max)
with(gDat, tapply(lifeExp,continent,max))
       
       
tapply(gDat$lifeExp,gDat$continent,range)
by(gDat$lifeExp,gDat$continent,FUN=range)
leByCont <- tapply(gDat$lifeExp,gDat$continent,range)
       do.call(rbind,leByCont)
       
library(plyr)
ddply(gDat, .(continent),summarise, median=median(lifeExp))
       leByCont <- ddply(gDat, .(continent), summarise, min=min(lifeExp),max=max(lifeExp))
       
       
       f<-function(x){coef(lm(lifeExp ~ I(year-min(year)), data=x))}
       ddply(gDat,.(country),f)
       
minYear<-min(gDat$year)
jFun<-function(df){
  jCoef<-coef(lm(lifeExp~I(year-minYear),df))
  names(jCoef)<-c("intercept","slope")
  jCoef
}
jFun(gDat)
jFun(subset(gDat,country=="Canada"))
gCoef<-ddply(gDat,.(country,continent),jFun)
str(gCoef)
head(gCoef)