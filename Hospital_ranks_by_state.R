#Providing Hospital Info by state, rank, and outcome

rankhospital <- function (state, outcome, num) {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    diseases <- c("heart attack", "heart failure", "pneumonia")
    
    if (nchar(state) != 2) {
        stop("Invalid state.")
    }
    if (is.element(outcome, diseases) == FALSE) {
        stop("Invalid outcome.")
    }
    
    data <- data[data$State == state, ]
    data[, c(11, 17, 23)] <- sapply(data[, c(11, 17, 23)], as.numeric)
    data <- data[order(data[, 2]), ]
    #Hospitals that do not have data on a particular outcome should
    #be excluded from the set of hospitals when deciding the rankings.
    
    if (outcome == "heart attack") {
        
    }
    
    else if (outcome == "heart failure") {
        data[which.max(data[, 17]), "Hospital.Name"]
    }
    else {
        data[which.max(data[, 23]), "Hospital.Name"]
    }
}

setwd("~/Desktop/hospital_data")
rankhospital("MD", "heart attack", 5)


if (as.integer(num) > 46) {
    stop("NA")
}
