

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
            if (num == "best") {
                num = 1
            } else if (num == "worst") {
                num = nrow(x)
            }
            x$Hospital.Name[num]
        },num)
    }
    
    else if (outcome =="heart failure") {
        s <- split (data, data$State)
        
        each <- lapply(s, function (x, num) { 
            x= x[order(x[,17], x[,2]),]
            if (num == "best") {
                num = 1
            } else if (num == "worst") {
                num = nrow(x)
            }
            x$Hospital.Name[num]
        },num)
    }
    
    else {
        s <- split (data, data$State)
        
        each <- lapply(s, function (x, num) { 
            x= x[order(x[,23], x[,2]),]
            if (num == "best") {
                num = 1
            } else if (num == "worst") {
                num = nrow(x)
            }
            x$Hospital.Name[num]
        },num)
    }
        return (data.frame(hospital=unlist(each), state=names(each)) ) 
}


setwd("~/Desktop/hospital_data")
head(rankall("heart attack", "worst"))
tail(rankall("pneumonia", 1))

