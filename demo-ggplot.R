##################################################
# Sample ggplot
# N. Stern, 06.12.2018
##################################################
months <-rep(c("jan", "feb", "mar", "apr", "may", "jun", 
               "jul", "aug", "sep", "oct", "nov", "dec"), 2)
chickens <-c(1, 2, 3, 3, 3, 4, 5, 4, 3, 4, 2, 2)
eggs <-c(0, 8, 10, 13, 16, 20, 25, 20, 18, 16, 10, 8)
values <-c(chickens, eggs)
type <-c(rep("chickens", 12), rep("eggs", 12))
mydata <-data.frame(months, values)

p <- ggplot(mydata, aes(months, values))

# won't work
# p +geom_bar()

p <- ggplot(mydata, aes(months, values))
p +geom_bar(stat = "identity")
