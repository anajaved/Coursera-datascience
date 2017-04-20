
#Finding hospital needing improvement

need_improvement <- function(state, outcome) {
    ## Read outcome data, check that state and outcome are valid, return hospital 
    ## name in that state with highest 30-day death rate
    
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
    data <- data[order(data[, 2]), ]
    
    if (outcome == "heart attack") {
        attack_max <- which.max(data[, 11])
        data[attack_max, "Hospital.Name"]
    } 
    
    else if (outcome == "heart failure") {
        failure_max <- which.max(data[, 17])
        data[failure_max, "Hospital.Name"]
    } 
    
    else {
        pneumo_max <- which.max(data[, 23])
        data[pneumo_max, "Hospital.Name"]
    }
    
}

setwd("~/Desktop/hospital_data")
need_improvement("MD", "heart attack") #"HARFORD MEMORIAL HOSPITAL"
