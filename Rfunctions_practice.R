above10 <- function (x) {
    use <- x>10
    x[use]
}

num <- 1:50
above10(num)

#####calculate each column mean in matrix

col_mean <- function(y) {
    nc <- ncol(y)
    means <- numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean(y[,i])
    }
    means
}

col_mean(cars)


#####Lexical Scoping & Functions w/in another

make_power <- function (n) {
    pow <- function (x) {
        x^n
    }
    pow
}

cube <- make_power(3)
square <- make_power(2)

cube(3)
square(4)
ls(environment(cube))

