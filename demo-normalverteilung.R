
###########################################################
# Normalverteilung Beispiel	
# Funktionsdauer	von	Taschenrechnern
# Die	Funktionsdauer	x	ist	normalverteilt	mit	Erwartungswert	µ = 120	h	
# und	 theoretischer	Varianz s2 = 100.	
# Wie	wahrscheinlich	ist	es,	dass	die	Funktionsdauer höchstens	135	h dauert
pnorm(q = 135, mean = 120, sd = 10)

# loesungsweg via standardiesierung
z <- (135-120) / 10
pnorm (q = 1.5, mean = 0, sd = 1)
# n.b. : mean und sd sind vorbelegt. Früher haette man aus tabelle diese Werte gelesen
# Um die"Wahrscheinlichkeit, dass die Dauer hoeher ist als x" :  
# 1 - n oder lower tail verwenden

# Rechnen	mit	der	Normalverteilung, dass	Wahrscheinlichkeit zwischen	105	und	135	Stunden	liegt:
pnorm (q= 135, mean = 120, sd= 10) - pnorm(q = 105, mean=120, sd=10)

# wleche lebensdauer wird von 95 % der TR nicht ueberschritten?
qnorm (p = 0.95, mean = 120, sd = 10)

# symmetreischer 95 %  - Bereich:
# untere Grenze  
qnorm (p = 0.025, mean = 120, sd = 10)
# obere Grenze  
qnorm (p = 0.975, mean = 120, sd = 10)
