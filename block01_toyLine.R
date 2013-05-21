# Software Carpentry in R workshop
# install.packages("plyr", dependencies = TRUE)
# install.packages("knitr", dependencies = TRUE)
# library(plyr)
# library(knitr)
# setwd("C:\\Users\\Administrator\\Desktop\\Software Carpentry in R workshop")
# attach(gapminderDataFiveYear.txt)

# session 1
getwd()
a <- 2
b <- 3
n <- 400
siqSq <- 0.5

x <- runif(n)
y <- a+b*x+rnorm(n,sd=sqrt(siqSq))
(avgX <- mean(x))

plot(x,y)
abline(a,b,col="blue",lwd=2)
dev.print(pdf,"niftyPlot.pdf")
write(avgX,"avgX.txt")

########################################################################################
# ###########                          NOTES                                 ###########
########################################################################################
# 1.1 try "ALT -" to get "<-"; save "=" for functional usage
# 1.2 type two first letters + "TAB" to finish tab completion
#     type two letters + "TAB" to navigate, and use hot key "F1" to pull out references in
#     help page
# 1.3 use ( ) to pull out output for inspection
#     date(): current data; objects(),ls(): current working space; rm(y),rm(list=ls()): 
#     clear working space
# 1.4 .RDate saves previous cripts and program (in Files)
# 1.5 Using "Projects" to create a new projects that we could currently work on
# 1.6 saving plots: dev.print(pdf,"niftyPlot.pdf"), to ensure reproducibility
# 1.7 work through scripts line by line using "CTRL+ENTER"
#########################################################################################
# 2.1 list.files(): all the things that we create
# 2.2 multi-panel conditioning, available in "lattice" package, and by using y ~ x|z, conditioning
#     on z
# 2.3 factor variable: devils
# 2.4 x[c(TRUE,FALSE)] # what is true comes out, indexing by logical values
#########################################################################################
# 3.1 sapply, lapply works on lists
# 3.2 use do.call(FUN= , list= ) to do aggregate your list output



