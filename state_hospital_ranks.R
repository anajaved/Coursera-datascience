#Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data, check that state and outcome are valid
    ## Return hospital name in that state with the given rank 30-day death rate
    
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data[, c(11, 17, 23)] <- sapply(data[, c(11, 17, 23)], as.numeric)
    diseases <- c("heart attack", "heart failure", "pneumonia")
    
    if (!(state %in% unique(data[,7]))) {
        stop("Invalid State.")
        }
    if (is.element(outcome, diseases) == FALSE) {
        stop("Invalid Outcome.")
        }
    
    if (outcome == "heart attack") {
        data <- data[data$State == state, c(2,11)]
        data <- data[order(data[,2], data$Hospital.Name),]
        }
    
    else if (outcome == "heart failure") {
        data <- data[data$State == state, c(2,17)]
        data <- data[order(data[,2], data$Hospital.Name),]
        }
    
    else {
        data <- data[data$State == state, c(2,23)]
        data <- data[order(data[,2], data$Hospital.Name),]
        }
    
    if (num == "best") {
        data[1, "Hospital.Name"]
        }
    else if (num == "worst") {
        max <- which.max(data[,2])
        data[max, "Hospital.Name"]
        }
    else{
        if (as.numeric(num) > nrow(data)) {
            print(NA)
            }
        else {
            data[num, "Hospital.Name"]
            }
        }
    }

setwd("~/Desktop/hospital_data")
rankhospital("TX", "heart failure", 4) #"DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart failure", 5) #SAINT AGNES HOSPITAL"
rankhospital("MN", "heart attack", 5000) #NA

rankhospital("NY", "pneumonia", num="best") #"MAIMONIDES MEDICAL CENTER"
rankhospital("NY", "pneumonia", 1) #"MAIMONIDES MEDICAL CENTER"

rankhospital("MD", "pneumonia", "worst") #"CIVISTA MEDICAL CENTER"

