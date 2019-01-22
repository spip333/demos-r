library(TeachingDemos)

setwd("C:/ieu/workspace/R/descriptive-statistik/demos-statistik")

###############################################################
# Aufgabe: Linksseitiger Test bei $\mu$, $\sigma$ bekannt
# Aufgabe: Die Datei „lightbulbs.txt“ enthält eine neue Stichprobe des Glühbirnenherstellers.
# Laden Sie die Datei mit dem Befehl scan. Lässt sich aufgrund dieser Stichprobe die Behauptung 
# des Herstellers, dass die Glühbirnen eine Mindestlebensdauer von 10'000 Stunden besitzen,
# bei einem Signifikanzniveau von 1% verwerfen? Die Standardabweichung beträgt 120 Stunden.

# H0 :  mu  >= 10'000 Stunden
# Ha :  mu < 10'000 Stunden

rm(list = ls())

lightbulbs <- scan(file = "lightbulbs.txt")

alpha <- 0.01
sigma <- 120
mu <- 10000

n <- length(lightbulbs)
xbar <- mean(lightbulbs)

# 1 : z berechnen
z <- (xbar - mu)/ (sigma /sqrt(n))
z.alpha <- qnorm(alpha)
z > z.alpha # false => h0 verwerfen

# 2. p value
p.val <- pnorm(z)
p.val > alpha # false => h0 verwerfen

# 3. z.test
res <- z.test(x = xbar, mu = mu, stdev = sigma, alternative = "less", n = n)
res$statistic
res$p.value > alpha

###############################################################
# Aufgabe: Rechtsseitiger Test bei $\mu$, $\sigma$ bekannt
# Aufgabe: Die Datei "cookies.txt" enthält eine neue Stichprobe des Keksherstellers. 
# Laden Sie die Datei mit dem Befehl scan. Lässt sich aufgrund dieser Stichprobe die Behauptung 
# des Herstellers, dass die Kekse einen maximalen Anteil von 2 g enthalten, bei einem 
# Signifikanzniveau von 10% verwerfen? Die Standardabweichung beträgt 0:25 g.

# h0 : mu <= 2
# ha : mu > 2

rm(list = ls())

cookies<- scan(file = "cookies.txt")

mu <- 2
sigma <- 0.25
alpha <- 0.10

n <- length(cookies)
xbar <- mean(cookies)

# 1. z - Value und krit. wert prüfen:
z <- (xbar - mu) / (sigma / sqrt(n))
z.krit <- qnorm(1-alpha)
z < z.krit # true, deshalb h0 behalten

# 2. p- Value und alpha vergleichen
p.val <- pnorm(z, lower = F)
p.val > alpha # true, deshalb h0 behalten

# 3. z-test 
z.test(x = xbar, mu =mu, stdev =sigma, alternative = "greater", conf.level = alpha, n = n)

###############################################################
# Aufgabe: Zweiseitiger Test bei mu, sigma bekannt
# Aufgabe: Die Datei penguins.txt enthält eine neue Zufallsstichprobe einer Pinguinkolonie. 
# Laden Sie die Datei mit dem Befehl scan.
# Das durchschnittliche Gewicht von antarktischen Königspinguinen diesern Kolonie betrug im letzten 
# Jahr 15.4 kg. Lässt sich aufgrund dieser Stichprobe die Behauptung, dass sich das 
# Durchschnittsgewicht der Pinguine nicht verändert hat, 
# bei einem Signifikanzniveau von 5% verwerfen?
# Die Standardabweichung beträgt 2.5 kg.

# h0 : mu = 15.4
# ha : mu != 15.4

rm(list = ls())
penguins <- scan(file = "penguins.txt")

mu <- 15.4
xbar <- mean(penguins)
n <- length(penguins)
sigma <- 2.5
alpha <- 0.05

# 1. z.value mit krit. wert vergleichen
z.val <- (xbar - mu) / (sigma / sqrt(n))

krit.unten <- qnorm(alpha/2)
krit.oben <- qnorm(1-(alpha/2))
z.val < krit.oben && z.val > krit.unten # True, h0 kann behalten werden

# 2. p.value mit conf.level vergleichen
p.val <- pnorm(z.val) * 2

p.val > alpha

# 3. z.test
z.test (x = xbar, n = n, alternative = "two.sided", mu = mu, stdev = sigma)
