###############################################################
# Aufgabe: Linksseitiger Test bei μ, σ unbekannt
# Aufgabe: Die Datei „lightbulbs.txt“ enthält eine neue Stichprobe des Glühbirnenherstellers. 
# Laden Sie die Datei mit dem Befehl scan. Lässt sich aufgrund dieser Stichprobe die 
# Behauptung des Herstellers, dass die Glühbirnen eine Mindestlebensdauer von 10000 Stunden
# besitzen, bei einem Signifikanzniveau von 1% verwerfen?
# h0 : mu >= 10000
# ha : mu < 10000

rm (list = ls())

lightbulbs <- scan(file = "lightbulbs.txt")

alpha <- 0.01
n <- length(lightbulbs)
mu <- 10000

xbar <- mean(lightbulbs)

# 1. t.value mit krit. value vergleichen
s <- sd(lightbulbs)
t.val <- (xbar - mu) / (s / sqrt(n))
krit.val <- qt(alpha, df = n -1)
t.val > krit.val # false, h0 kann verworfen werden

# 2. p-value mit Signifikanz niveau
p.val <- pt(t.val, df = n-1)
p.val > alpha # false, h0 kann verworfen werden

# 3. t.test
t.test(x = lightbulbs, alternative = "less", mu = mu, conf.level = alpha)

###############################################################
# Aufgabe: Rechtsseitiger Test bei μ, σ unbekannt
# Aufgabe: Die Datei „cookies.txt“ enthält eine neue Stichprobe des Keksherstellers. 
# Laden Sie die Datei mit dem Befehl scan. Lässt sich aufgrund dieser Stichprobe 
# die Behauptung des Herstellers, dass die Kekse einen maximalen Anteil von 2 g enthalten, 
# bei einem Signifikanzniveau von 10% verwerfen
# H0 : mu <= 2
# Ha : mu > 2

rm (list = ls())

cookies <- scan(file = "cookies.txt")

n <- length (cookies)
alpha <- 0.10
mu <- 2

# 1 t.value berechnen und vergleichen mit krit. wert
xbar <- mean(cookies)
s <- sd(cookies)
df <- n - 1

t.val <- (xbar - mu)/ (s/sqrt(n))

krit.val <- qt(1-alpha, df)
t.val < krit.val # true, h0 kann behalten werden

# 2. p-valuetrue
p.val <- pt(t.val, df, lower=F)
p.val > alpha # false, h0 kann behalten werden

# 3. t.test
t.test(x =cookies, alternative = "greater", mu = mu, conf.level = alpha)

###############################################################
# Aufgabe: Zweiseitiger Test bei µ, σ unbekannt
# Aufgabe: Die Datei „penguins.txt“ enthält eine neue Zufallsstichprobe einer Pinguinkolonie.
# Laden Sie die Datei mit dem Befehl scan.
# Lässt sich aufgrund dieser Stichprobe die Behauptung, dass sich das Durchschnittsgewicht 
# der Pinguine nicht verändert hat, bei einem Signiﬁkanzniveau von 5% verwerfen
# h0 : mu = 15.4
# ha : mu !=15.4

rm (list = ls())
penguins <- scan(file = "penguins.txt")

alpha <- 0.05
n <- length(penguins)
mu <- 15.4
xbar <- mean(penguins)
s <- sd(penguins)
df <- n-1

# 1. t.val
t.val <- (xbar - mu) / (s / sqrt(n))
krit.unten <- qt(alpha / 2, df)
krit.oben <- qt(1 - (alpha / 2), df)
t.val < krit.oben && t.val > krit.unten # true, h0 behalten

# 2. p.val mit signifikanzniveau vergleichen
p.val <- pt(t.val, df = df) * 2

p.val > alpha  # true, h0 behalten

# 3. t.test
t.test(penguins, alternative = "two.sided", mu = mu, conf.level = alpha)
