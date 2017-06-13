
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
