# Session 2
ls()
gDat <- read.delim("gapminderDataFiveYear.txt")
gDat <- read.table("gapminderDataFiveYear.txt",header=TRUE,sep="\t")
str(gDat)
head(gDat)
tail(gDat)

sort(sample(x=nrow(gDat),size=6))
gDat[sort(sample(x=nrow(gDat),size=6)), ]
peek <- function(df) {
  df[sort(sample(x=nrow(df),size=6)), ]
}
peek(gDat)
str(gDat)
names(gDat)
dim(gDat)
nrow(gDat)
ncol(gDat)
length(gDat)
head(rownames(gDat))

library(lattice)
summary(gDat)
xyplot(lifeExp ~ year,gDat)
xyplot(lifeExp ~ year,gDat,
       subset = country=="Colombia")
xyplot(lifeExp ~ gdpPercap,gDat,
       subset = year == 2007)
xyplot(lifeExp ~ gdpPercap | continent, gDat,
       subset = year == 2007)
xyplot(lifeExp ~ gdpPercap, gDat, group=continent, auto.key=TRUE,
       subset = year == 2007)

gDat$lifeExp
densityplot(~ lifeExp, gDat)
table(gDat$continent)
str(gDat)
class(gDat$continent)
levels(gDat$continent)
nlevels(gDat$continent)
barchart(table(gDat$continent))
dotplot(table(gDat$continent),type="h")
dotplot(table(gDat$continent),type=c("p","h"))

subset(gDat, subset = country == "Uruguay")
subset(gDat,subset = country %in% c("Japan","Belgium"))
subset(gDat, subset= country=="Uruguay",select=c(country,year,lifeExp))
subset(gDat,subset=country!="United States",select=c(country,lifeExp))
xyplot(lifeExp~year, gDat, subset=country=="Canada")
lm(lifeExp~year,gDat,subset=country=="Canada")
(minYear<-min(gDat$year))
lm(lifeExp~I(year-minYear),gDat,subset=country=="Canada")

x <- 3*4
x
is.vector(x)
length(x)
x[2]<-100
x 
x[5] <- 3
x
x <- rnorm(25)
x^2
(y <- 1:3)
(z <- 3:7)
y + z
y<-1:10

x <- list("cabbage",pi,TRUE,4.3)
class(x)
x[[2]]==pi
pi
x
mode(x)

set.seed(1)
x <- round(rnorm(8),2)
x
names(x) <- letters[seq_along(x)]
x[3]
x[c(2,6,7)]
x[-4]
x>0
x[x>0]
x[c(TRUE,FALSE)] # what is true comes out 
x[!(x>0)]
x["a"]
x[c("b","e")]
ggDat  <-  gDat
ggDat <- transform(ggDat,yearAlt = year-minYear)
summary(ggDat)