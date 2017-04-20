
#30-day mortality rates for Heart Attack Histogram
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


#Finding the best hospital in the state

best <- function(state, outcome) {
    ## Read outcome data, check that state and outcome are valid, return hospital 
    ## name in that state with lowest 30-day death rate
    
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    diseases <- c("heart attack", "heart failure", "pneumonia")
    
    if (!(state %in% unique(data[,7]))) {
        stop("Invalid State.")
    }
    
    if (is.element(outcome, diseases) == FALSE) {
        stop("Invalid Outcome.")
    }
    
    data <- data[data$State == state, ]
    data[, c(11, 17, 23)] <- sapply(data[, c(11, 17, 23)], as.numeric)
    data<- data[order(data[,2]),]
    
    if (outcome == "heart attack") {
        attack_min <- which.min(data[, 11])
        data[attack_min, "Hospital.Name"]
    } 
    
    else if (outcome == "heart failure") {
        failure_min <- which.min(data[, 17])
        data[failure_min, "Hospital.Name"]
    } 
    
    else {
        pneumo_min <- which.min(data[, 23])
        data[pneumo_min, "Hospital.Name"]
    }
}

setwd("~/Desktop/hospital_data")
best("TX", "heart failure") #"FORT DUNCAN MEDICAL CENTER"
best("MD", "heart attack") #"JOHNS HOPKINS HOSPITAL, THE"
best("CS", "heart attack") #Invalid State.
best("NY", "hert attack")  #Invalid Outcome.

