############################################
## Demo: Korrelation
## cf. trace descriptive statistik 2019-01-11
############################################

##############
# Bsp 3.15
# n = 600, r = 0,36 : comment simuler des données pour obtenir r = 0.36?
# Simuliere Datensatz 2 Merkmale mit gegebener Korrelation
n <- 600
r <- 0.36
# sigma : Kovarianz - Matrix 
my.sigma <- matrix(c(1, r, r, 1), nrow=2, ncol = 2, byrow = F)

my.sigma

daten <- mvrnorm(n = 600, mu = c(0,0), Sigma = my.sigma, empirical = T)

head(daten)

X <- daten[,1]
Y <- daten[,2]

cor(X,Y)
plot(X,Y)


