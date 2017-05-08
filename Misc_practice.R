#R creating variables practice/ creating factors 

yesno <- sample(c("yes", "no"), size=10, replace=T)
yesnofac <-  factor(yesno)
relevel(yesnofac, ref="yes")

round(3.345, digits = 1)

#Reshaping data 
install.packages("Hmisc")
library(reshape2)
library(Hmisc)
data(mtcars)

mtcars$carname <- rownames(mtcars)
head(mtcars$carname, 5)

#Melting Data 
carMelt <- melt(mtcars, id=c("carname", "gear","cyl"), 
                measure.vars =c("mpg","hp"))

head(carMelt, 3)  #shows mpg variable
tail(carMelt, 3)  #shows hp variable 

#Casting Data 
cylData <- dcast(carMelt, cyl~variable, mean)
cylData  #provides mean mpg & hp for each cyl 
