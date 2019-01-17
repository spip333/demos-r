library(faithful)
eruption.lm <- lm(eruptions~waiting , data = faithful)
summary(eruption.lm)


# Sind die reste normalverteilt ? TEST
library(moments)
jarque.test(eruption.lm$residuals)
?jarque.test


# 

# generate random numbers from normal distribution
v1 <- rnorm(10000, mean=10, sd=3)
jarque.test(v1)
#JB = 0.85028, p-value = 0.6537
v1 <- rnorm(10000, mean=10, sd=2)
jarque.test(v1)
# JB = 2.4359, p-value = 0.2958
v1 <- rnorm(10000, mean=10, sd=1)
jarque.test(v1)
#JB = 5.8373, p-value = 0.05401
v1 <- rnorm(10000, mean=10, sd=0.1)
jarque.test(v1)
#JB = 0.97278, p-value = 0.6148

