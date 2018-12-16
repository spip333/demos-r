# Sigma bekannt

# Für die Standardabweichung der Körpergrössen der
# Studierenden gelte sigma = 9:48. Bestimmen Sie den Fehlerbereich und
# die Intervallschätzung der durchschnittlichen Körgergrösse bei einem
# Konfidenzniveau von 95 %
library(MASS)

height <- na.omit(survey$Height)
length(survey$Height)
n<-length(height)
sigma <- 9.48
sem <- sigma/sqrt(n)
# Fehlerbereich
ME <- qnorm(0.975)*sem
ME
xbar <- mean(height)
xbar + c(-ME,ME)


# Sigma unbekannt

# Bestimmen Sie für die durchschnittliche Körpergrösse den Fehlerbereich und die
# Intervallschätzung der durchschnittlichen Körgergrösse bei einem Konfidenzniveau von 95%.

height.response <- na.omit(survey$Height)
n <- length(height.response)
s <- sd(height.response)
SE <- s/sqrt(n)
E <- qt(.975, df=n-1)*SE
xbar <- mean(height.response)
xbar + c(-E,E)


# Stichprobengrösse bei mu:

# Problem: Bestimmen Sie benötigte Stichprobengrösse für die durchschnittliche 
# Körpergrösse bei einem Fehlerbereich von 1.2 cm und einem Konfidenzniveau von 95%.
height.response <- na.omit(survey$Height)
zstar <- qnorm(0.975)
s <- sd(height.response)
E <- 1.2
zstar^2*s^2/E^2

# Intervallschätzung eines Populationsanteils p

# Problem: Bestimmen Sie den Fehlerbereich und die Intervallschätzung für den Anteil
# der weiblichen Studierenden aus survey bei einem Konfidenzniveau von 95%.
gender.response <- na.omit(survey$Sex)
n <- length(gender.response)
k <- sum(gender.response == "Female")
pbar <- k/n
pbar
SE <- sqrt(pbar*(1-pbar)/n)
SE
E <- qnorm(.975)*SE
E
pbar + c(-E,E)

# Stichprobengrösse beim Populationsanteil p
# Problem: Bestimmen Sie die Stichprobengrösse einer Umfrage zur
# Bestimmung des Anteils der weiblichen Studierenden. Der
# Fehlerbereich soll 5% betragen. Sie vermuten aus früheren Umfragen
# eine Anteil in der Grösse von p = 0:5. Das Konfidenzniveau ist 95%.
# NB: ist p nicht bekannt, dann nimmt man 0.5 (Worst case)
zstar <- qnorm(0.975)
p <- 0.5
E <- 0.05
zstar^2 * p * (1-p) / E^2

