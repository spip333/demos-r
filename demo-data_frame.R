### #######################################################
# Demo Data frame
### #######################################################

### #######################################################
# Planets
### #######################################################
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", 
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
planets_df <- data.frame(name, type, diameter, rotation, rings)
str(planets_df)
planets_df
summary(planets_df)
summary(planets_df$name)
class(planets_df)
class(planets_df$name)
class(planets_df$diameter)
planets_df[diameter>1,]
?str
?summary
### #######################################################
# Custom Data Frame
### #######################################################
v1 <- c(11,22,33,11,22,33,11)
v2 <- c("a","b", "c", "a", "c", "c", "a")
mdf <- data.frame(v1, v2)
str(mdf)
mdf
mdf[1]
mdf[2]
mdf[1:2]
mdf[v2=="a",] 
colnames(mdf)
mdf
class(mdf$v1)
class(mdf$v2)
colnames(mdf)<- c("col1", "col2")
class(mdf$v1) # will display NULL
mdf[col2=="a",] # now working
mdf[v2=="a",] # Still working

### #######################################################
# Titanic data
### #######################################################
# Laden (ggf. vorher installieren) Sie das Paket foreign. 
# Laden Sie die Daten über den Untergang der Titanic mit folgendem Befehl:  
# titanic <- read.dta("http://www.stata-press.com/data/kkd/titanic2.dta") und 
# machen Sie sich ein bisschen mit den Daten vertraut (z.B. head() oder summary()).
# Erzeugen Sie eine Kreuztabelle mit den Variablen class und survived.
# Berechnen Sie Median und Mittelwert des Alters für Überlebte und Gestorbene. 
# Unterscheiden sich die beiden Gruppen bzgl. ihres Alters?
library(foreign)
titanic <- read.dta("http://www.stata-press.com/data/kkd/titanic2.dta")
head(titanic)
class(titanic)
summary(titanic)
str(titanic)
titanic$age2
titanic[titanic$sex == "women",]
titanic[titanic$age2 < 10,]
titanic[age2 < 10,] # does not work. Why????
colnames(titanic)
#colnames(titanic)<- c("genre", "classe", "age", "survivant")
#titanic[titanic$age2 < 10,] # does not work anymore
#titanic[age < 10,] # does not work - why ???
#titanic[titanic$age < 10,] # does work anymore

# attach, detach
titanic[titanic$age2 < 10,]
titanic[age2 < 10,] # does not work. Why????
attach(titanic)
titanic[age2 < 10,] # now it works!!!
detach(titanic)

head(titanic[1:3]) # displays 3 columns
head(titanic[,1:3]) # displays 3 columns
titanic[1:3,] # displays 3 rows
titanic[10:15,] # displays 6 rows

#discard unused factors
# Besatzung entfernen
summary(titanic) # hat Besatzung
titanic$class <- droplevels(titanic$class)
summary(titanic) # keine Besatzung mehr

# cross table class vs survivors 
cross.table.class.survivors <- table(titanic$class, titanic$survived)
cross.table.class.survivors
cross.table.class.survivors[1,]
cross.table.class.survivors[, "no"]

# répartition des survivants selon le sexe
cross.sex.surviors <- table(titanic$sex,titanic$survived)
cross.sex.surviors
addmargins(cross.sex.surviors)

round(prop.table(cross.sex.surviors, margin=1),2)
# total = 100 par ligne: 73 % des femmes on survécu 

round(prop.table(cross.sex.surviors, margin=2),2)
# total = 100 par colonne: 92 % des morts sont des hommes

# repartition des passagers selon la classe
table(titanic$class)
total <- sum(table(titanic$class))
round(table(titanic$class) / total, 2)

# Erzeugen Sie eine Kreuztabelle mit den Variablen class und survived.
# proportion de survivants par classe
round(prop.table(cross.table.class.survivors, margin=1),2)
# -> total de 100 par ligne : 38% des passagers de 1ère ont survécu

# proportion de survivants par classe
round(prop.table(cross.table.class.survivors, margin=2),2)
# -> total de 100 par colonne : 8% des morts étaient in 1st. class

# Berechnen Sie Median und Mittelwert des Alters für Überlebte und Gestorbene. 
# Unterscheiden sich die beiden Gruppen bzgl. ihres Alters?
mean(titanic$age2[titanic$survived == "yes"])
tapply(titanic$age2, titanic$survived, mean)
?tapply
mean(titanic$age2[titanic$survived == "no"])
median(titanic$age2[titanic$survived == "yes"])
median(titanic$age2[titanic$survived == "no"])

# liste des passagères mortes
titanic[titanic$sex=="women" & titanic$survived == "no",]
# age moyen des femmes à bord
mean(titanic$age2[titanic$sex=="women"])
# age moyen des femmes mortes
mean(titanic$age2[titanic$sex=="women" & titanic$survived == "no"])

library(dplyr)
# création d'une nouvelle variable "child" 
titanic %>% 
  mutate(child = age2 < 18) %
  head()

# création d'une nouvelle variable "retired" 
titanic %>% 
  mutate(retired = age2 > 60) %>% 
  head()


  

