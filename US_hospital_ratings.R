
#30-day mortality rates for Heart Attack Histogram
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
sec <- sapply(data[, c(11, 17, 23)], as.numeric)
sec<- sec[order(sec[, 2]), ]

#Finding the best hospital in the state

best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death rate
    
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
    
    if (outcome == "heart attack") {
        data[which.min(data[, 11]), "Hospital.Name"]
        
    }
    else if (outcome == "heart failure") {
        data[which.min(data[, 17]), "Hospital.Name"]
    }
    else {
        data[which.min(data[, 23]), "Hospital.Name"]
    }
    
}

#Finding hospital needing improvement
need_improvement <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death rate
    
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
    
    if (outcome == "heart attack") {
        data[which.max(data[, 11]), "Hospital.Name"]
        
    }
    else if (outcome == "heart failure") {
        data[which.max(data[, 17]), "Hospital.Name"]
    }
    else {
        data[which.max(data[, 23]), "Hospital.Name"]
    }
    
}

setwd("~/Desktop/hospital_data")
best(state="MD", "heart attack")
need_improvement(state="MD", "heart attack")


