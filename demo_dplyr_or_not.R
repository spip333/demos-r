############################################
# filtering with dplyr vs. not dplyr
############################################

head(mtcars)

# Var 1: filtre sur mtcars, avec dplyr ne conserver que les automatiques 
auto1 <- mtcars %>%
  filter(am == 1)

head(auto1)

# Var 2: filtre sur mtcars, sans dplyr ne conserver que les automatiques 
auto2 <-  mtcars[mtcars$am==1,]

head(auto2)


# Décomposition
L <- mtcars$am==0
mpg.auto <- mtcars[L,]$mpg
mpg.manual <- mtcars[mtcars$am==1,]$mpg

L
head(mpg.auto)
