######################################################33
# demo relative Häufigkeitsverteilung 
# 
# cf. uebung 3
######################################################33
gender <- sample(c("male", "female"), 100, replace = T)
choice <- sample (c("yes", "no"), 100, replace = T)
sport <- sample(c("yes", "no"), 100, replace = T)

df <- data.frame(gender, choice, sport)

t <- table (df$gender, df$choice)

addmargins(t)

prop.table(t)

addmargins(prop.table(t, 1))
addmargins(prop.table(t, 2))
