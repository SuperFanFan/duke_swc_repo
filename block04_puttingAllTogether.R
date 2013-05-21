gDat <- read.delim("gapminderDataFiveYear.txt")
str(gDat)
minYear<-min(gDat$year)
jFun<-function(df){
  jCoef<-coef(lm(lifeExp~I(year-minYear),df))
  names(jCoef)<-c("intercept","slope")
  return(jCoef)
}
jFun(gDat)
jFun(subset(gDat,country=="Canada"))
gCoef<-ddply(gDat,.(country,continent),jFun)
str(gCoef)
head(gCoef)

library(lattice)
bwplot(slope ~ continent, gCoef)
gCoef$continent <- reorder(gCoef$continent,gCoef$slope)
bwplot(slope ~ continent, gCoef)

levels(gCoef$continent)

foo <- subset(gCoef,continent!="Oceania")
str(foo)
subset(foo,country=="New Zealand")
levels(gCoef$continent)
droplevels(foo)
gCoef<-droplevels(subset(gCoef,continent!="Oceania"))
levels(gCoef$continent)
write.table(gCoef,"gCoef.txt",row.names=FALSE,quote=FALSE,sep="\t")

gCoef<-read.delim("gCoef.txt")
levels(gCoef$continent)
gCoef$continent<-reorder(gCoef$continent,gCoef$slope)

dput(gCoef,"gCoef_DPUT.txt")
rm(gCoef)
gCoef<-dget("gCoef_DPUT.txt")
levels(gCoef$continent)

saveRDS(gCoef,"gCoef.rds")
rm(gCoef)
gCoef<-readRDS("gCoef.rds")
levels(gCoef$continent)











