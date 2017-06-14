#Base Plot System
library(datasets)
data(cars)
with(cars, plot(speed,dist))

#Lattice System & Plot
library(lattice)
state <- data.frame(state.x77, region= state.region)
xyplot(Life.Exp ~ Income | region, data=state, layout= c(4,1))

#ggplot2 system
library(ggplot2)
data(mpg)
qplot(displ, hwy, data=mpg)


#boxplot by factoring the months of airquality variable of month
library(datasets)
str(airquality)
class(airquality$Month)

airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone~Month, airquality, xlab="Month", ylab="Ozone", 
        pch=10, col="light blue")

par(bg="white")

#Adding a title in Base Plotting Functions
library(datasets)
with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind in NYC")

#Base Plot with Annotation
with(airquality, plot(Wind, Ozone, main="Ozone & Wind in NYC", type="n"))
with(subset(airquality, Month==5), points(Wind, Ozone, col='blue'))

##Another Example of Base Plot w/ Annotation (with legend & color)
with(airquality, plot(Wind, Ozone, type="n",main="Wind and Ozone in NYC"))
with(subset(airquality, Month==5), points(Wind, Ozone, col='blue'))
with(subset(airquality, Month!=5), points(Wind, Ozone, col='red'))
legend("topright", pch=1, col=c("blue", "red"), legend=c("May", "Other Months"))

#Base Plot w/Regression Line
with(airquality, plot(Wind, Ozone, main="Ozone and Wind in NYC",
                      pch=20))
model <- lm(Ozone~Wind, airquality)
abline(model, lwd=2)

str(airquality)

#Multiple Base Plots!
par(mfrow=c(1,3), mar= c(4,4,2,1), oma=c(0,0,2,0))
with(airquality, {
    plot(Wind, Ozone, main="Ozone & Wind")
    plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
    plot(Temp, Ozone, main="Ozone and Temp")
    mtext("Ozone on Weather in NYC", outer=T)
})

#Editing Margins:
x<- rnorm(100)
y<- rnorm(100)
plot(x,y)
par("mar")
