###########################################################
# Student T Verteilung Beispiel	
x <- seq(-4, 4, length=100)
hx <- dnorm(x)
degf <- c(1, 3, 8, 30)
colors <- c("red", "blue", "darkgreen", "gold", "black")
labels <- c("df=1", "df=3", "df=8", "df=30", "normal")

plot(x, hx, type="l", lty=2, xlab="t-Verteilungen", ylab="Dichte")
for (i in 1:4){lines(x, dt(x,degf[i]), lwd=2, col=colors[i])}
legend("topright", inset=.05, title="Verteilungen",
       labels, lwd=2, lty=c(1, 1, 1, 1, 2), col=colors)
