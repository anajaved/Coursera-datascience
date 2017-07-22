#Lattice Panel Functions
library(lattice)

#Example 1
set.seed(10)
x<- rnorm(100)
f<- rep(0:1, each = 50) #50 0's and 50 1's 
y <- x+f-f*x + rnorm (100, sd=0.5)
xyplot(y~x|f, layout=c(2,1))

##creating custom panel function 
xyplot(y~x|f, panel= function (x,y, ...)
    { panel.xyplot(x,y,...)
    panel.abline(h=median(y), lty=2)
})

#Example2 - layering plots 
library(ggplot2)
str(cars)
cars$rand = rnorm(50, mean=25)

qplot(rand, dist, data=cars, geom=c("point", "smooth"),
      method='lm') +geom_point()

    #or
qplot(rand, dist, data=cars) + geom_point() + geom_smooth(method="lm")

