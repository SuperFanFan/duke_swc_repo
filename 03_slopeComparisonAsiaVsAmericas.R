library(lattice)
library(knitr)
gCoef<-readRDS("gCoef.rds")

str(gCoef)

hDat<-droplevels(subset(gCoef,continent %in% c("Asia","Americas")))
str(hDat)

pdf("slopes_AsiaVsAmericas.pdf")
dotplot(slope ~ continent,hDat)
dev.off()

sink("slopes_AsiaVsAmericas.txt")
t.test(slope~continent,hDat)
sink()