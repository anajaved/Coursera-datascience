
Base Plot System
================

Oldest system, more intuitive. Start off with a plot function, and add on features one by one. Can use annotations to add/modify plot (such as text, lines, points, and axis). Convenient but can't go back once started.

``` r
library(datasets)
data(cars)
with(cars, plot(speed,dist))
```

![](https://github.com/anajaved/coursera-datascience/blob/master/figure-markdown_github/unnamed-chunk-1-1.png)

Lattice System & Plot
=====================

Plots are created with a single function call (xyplot, bwplot, etc.) - most useful for conditioning types of plots.

``` r
library(lattice)
state <- data.frame(state.x77, region= state.region)
xyplot(Life.Exp ~ Income | region, data=state, layout= c(4,1))
```

![](https://github.com/anajaved/coursera-datascience/blob/master/figure-markdown_github/unnamed-chunk-2-1.png)

ggplot2 System
==============

Requires ggplot package. Splits the difference between base plot syste and lattice systems. Automatically arranges spacing, text, titles - but still customizable.

``` r
library(ggplot2)
data(mpg)
qplot(displ, hwy, data=mpg)
```

![](https://github.com/anajaved/coursera-datascience/blob/master/figure-markdown_github/unnamed-chunk-3-1.png)

Ozone Airquality Boxplot
========================

``` r
#boxplot by factoring the months of airquality variable of month
library(datasets)
class(airquality$Month)
```

    ## [1] "integer"

``` r
airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone~Month, airquality, xlab="Month", ylab="Ozone")
```

![](https://github.com/anajaved/coursera-datascience/blob/master/figure-markdown_github/unnamed-chunk-4-1.png)

Adding a title in Base Plotting Functions
=========================================

``` r
library(datasets)
with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind in NYC")
```

![](https://github.com/anajaved/coursera-datascience/blob/master/figure-markdown_github/unnamed-chunk-5-1.png)

Another Example of Base Plot w/ Annotation (with legend & color)
----------------------------------------------------------------

``` r
with(airquality, plot(Wind, Ozone, type="n",main="Wind and Ozone in NYC"))
with(subset(airquality, Month==5), points(Wind, Ozone, col='blue'))
with(subset(airquality, Month!=5), points(Wind, Ozone, col='red'))
legend("topright", pch=1, col=c("blue", "red"), legend=c("May", "Other Months"))
```

![](https://github.com/anajaved/coursera-datascience/blob/master/figure-markdown_github/unnamed-chunk-6-1.png)
