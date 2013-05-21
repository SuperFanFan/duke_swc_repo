library(plyr)
# wrap up and go
gDat <- read.delim("gapminderDataFiveYear.txt")
minYear<-min(gDat$year)
jFun<-function(df){
  jCoef<-coef(lm(lifeExp~I(year-minYear),df))
  names(jCoef)<-c("intercept","slope")
  return(jCoef)
}
gCoef<-ddply(gDat,.(country,continent),jFun)
head(gCoef)
gCoef$continent <- reorder(gCoef$continent,gCoef$slope)
gCoef<-droplevels(subset(gCoef,continent!="Oceania"))
write.table(gCoef,"gCoef.txt",row.names=FALSE,quote=FALSE,sep="\t")
saveRDS(gCoef,"gCoef.rds")
readRDS("gCoef.rds")