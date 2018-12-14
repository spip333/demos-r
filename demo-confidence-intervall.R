#Für die Standardabweichung der Körpergrössen der
#Studierenden gelte sigma = 9:48. Bestimmen Sie den Fehlerbereich und
#die Intervallschätzung der durchschnittlichen Körgergrösse bei einem
#Konfidenzniveau von 95

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
