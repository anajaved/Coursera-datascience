

rankall <- function(outcome, num = "best") {
    ## Read outcome data, check that state and outcome are valid
    ## For each state, find the hospital of the given rank, return a dataframe 
    ##with the hospital names and the (abbreviated) state name
    
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data <- na.omit(data)
    diseases <- c("heart attack", "heart failure", "pneumonia")
    data[, c(11, 17, 23)] <- sapply(data[, c(11, 17, 23)], as.numeric)
    
    if (is.element(outcome, diseases) == FALSE) {
        stop("Invalid Outcome.")
    }
    
    if (outcome =="heart attack") {
        s <- split (data, data$State)
        
        each <- lapply(s, function (x, num) { 
            x= x[order(x[,11], x[,2]),]
            print( x$Hospital.Name[num])
            print(x$State[num])
        },num)
}
}


setwd("~/Desktop/hospital_data")
rankall("heart attack", 1)
