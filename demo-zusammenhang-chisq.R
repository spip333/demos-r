

########################################
# Zusammenhang: nominale Merkmale
studis <- matrix(c(110, 120, 20, 30, 20, 90, 60, 30, 10, 10), nrow = 2, byrow = T )
studis
rownames(studis) <- c("weiblich", "männlich")
colnames(studis) <- c("BWL", "Soz", "VWL", "SoWi", "Stat")
studis
chisq.test(studis)
chisq.test(studis)$statistic
sqrt(chisq.test(studis)$statistic / (sum(studis)*(min(dim(studis))-1)))

# note: spaltenzahl einer matrix
dim(studis)

# Zusammenhang: metrische Merkmale
einkommen <- c(1850, 2500, 2560, 2230, 1800)
alter <- c(21, 46, 55, 35, 28)
plot(alter, einkommen)
cor(einkommen, alter) # immer zwischen -1 und 1 oder 0 und 1 (?)
abline(lm(einkommen~alter)) # y modelliert durch x-dim
