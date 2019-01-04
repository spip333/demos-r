###########################################################
# Hypothesis Test auf Population
# 01.01.2019


# ############################################
# Linksseitiger Test des Populationsanteils p
# Aufgabe: Die Wahlbeteiligung an den letzten Wahlen betrug 60%. Eine
# telefonische Umfrage ergab, dass 85 von 148 Befragten angaben, an
# den kommenden Wahlen teilzunehmen. Lässt sich die Hypothese,
# dass die kommende Wahlbeteiligung über 60% liegt, bei einem
# Signifikanzniveau von 5% verwerfen?
# h0 : p >= 0.6
# ha : p < 0.6

alpha <- 0.05
p <- 85 / 148
p0 <- 0.6
n <- 148

z.val <- (p - p0 )/sqrt (p0 * (1-p0) / n)

# krit. wert:
z.alpha <- qnorm(alpha)

# h0 wird verworfen wenn z.val < z.alpha
z.val < z.alpha
# h0 wird behalten


# alternative : p-wert mit Signifikanzniveau vergleichen:
p.val <- pnorm(z.val)

# h0 wird verworfen wenn p-val < alpha
p.val < alpha
# h0 wird behalten

# ############################################
# Rechtsseitiger Test des Populationsanteils p
# Aufgabe: Die Apfelernte im letzten Jahr enthielt 12% faule Äpfel. Im
# aktuellen Jahr zeigte eine Zufallsstichprobe 30 verfaulte Äpfel auf
# insgesamt 214 Äpfeln. Lässt sich die Hypothese, dass in diesem Jahr
# der Anteil verfaulter Äpfel weniger als 12% beträgt, bei einem
# Signifikanzniveau von 5% verwerfen?
# h0 : p <= 0.12
# ha : p > 0.12

alpha <- 0.05
p0 <- 0.12
p <- 30 / 214
n <- 214

z.val <- (p-p0) / sqrt(p0*(1-p0) / n)

z.crit <- qnorm (1-alpha)

# h0 wird nicht verworfen wenn z.value < crit. wert
z.val < z.crit
# true: h0 wird nicht verworfen

# alternativ: berechnung von p-val:
p.val <- pnorm(z.val, lower=F)

# h0 wird behalten wenn z.val > alpha
z.val > alpha
# true: H0 wird behalten

# ############################################
# Zweiseitiger Test des Populationsanteils p
# Nach 20 Würfen zeigt eine Münze 12 Kopf. 
# Lässt sich bei einem Signifikanzniveau von 5% die Behauptung verwerfen, dass es
# sich um eine faire Münze handelt?
# H0 : p = 0.5
# Ha : p != 0.5

# Berechnung von Z:
p <- 12/20
p0 <- 0.5
n <- 20
alpha <- 0.05
z.val <- ( p - p0 ) / sqrt((p0 * (1-p0)) / n)
z.val
z.alpha <- qnorm(1-alpha/2)
z.alpha
c(-z.alpha, z.alpha)

# H0 wird nicht verworfen wenn z.val im Intervall -z.alpha, z.alpha 
z.val < z.alpha && z.val > -z.alpha
# H0 wird nicht verworfen

# Berechnung über die p-Wert:
p.val <- 2*pnorm(z.val, lower.tail = F)

# h0 beibehalten wenn p.val > signifikanzniveau
p.val > alpha
# H0 wird nicht verworfen
