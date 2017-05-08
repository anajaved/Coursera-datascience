#R creating variables practice/ creating factors 

yesno <- sample(c("yes", "no"), size=10, replace=T)
yesnofac <-  factor(yesno)
relevel(yesnofac, ref="yes")

round(3.345, digits = 1)

#Reshaping data 
