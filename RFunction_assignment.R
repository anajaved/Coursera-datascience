#For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:
#    
#   Date: the date of the observation in YYYY-MM-DD format (year-month-day)
#   sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
#   nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

#part1
setwd("~/Desktop")

pollutantmean <- function (directory, pollutant, id=1:332){
    setwd(directory)
    len <- length(id)
    total_mean <- 0
    (total_mean+ind_mean)/len
    
    for (i in id) {
        
        if (i <=9) {
            new_id <- paste0("00", i)
            filename <- paste0(new_id, ".csv")
            filename
            }
    
        elif (i <= 99 & i >= 10) {
            new_id <- paste0("0", i)
            filename <- paste0(new_id, ".csv")
            filename
            } 
        
        elif (i >=100) {
            filename <- paste0(i, ".csv")                
            filename
            }

        data<- read.csv(filename)
        ind_mean <- mean(data[[pollutant]], na.rm = TRUE)
        total_mean <- total_mean + ind_mean
    }
}




setwd("~/Desktop")
#pollutantmean(directory = "specdata",pollutant ="nitrate" , id=189)
pollutantmean("specdata", "nitrate", 70:72)

