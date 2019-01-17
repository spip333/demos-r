#################################################################
# summary notes uebungen
#
#################################################################
library(MASS)


#################################################################
## Uebung 1
##
head(painters)
# Bestimmen Sie diejenige Schule mit den meisten Malern.
sf <- table(painters$School)
sf
max(sf)

dfs <- data.frame(sf)
dfs

dfs[dfs[2] == max(sf)]

#Finden Sie die Schule mit dem höchsten Wert der Variable Composition.
m <- max(painters$Composition)
m
painters[painters$Composition == m,]$School
# or
painters[which(painters$Composition == m),]$School

