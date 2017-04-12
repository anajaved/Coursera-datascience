#For example, data for monitor 200 is contained in the file "200.csv". Each file contains three variables:
#    
#   Date: the date of the observation in YYYY-MM-DD format (year-month-day)
#   sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)
#   nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)

#part1
setwd("~/Desktop")

pollutantmean <- function (directory, pollutant, id=1:332){
    setwd(directory)
    sums <- numeric()
    n <- numeric()
    i <- 1
    
    for (i in id) {
        
        if (i <=9) {
            new_id <- paste0("00", i)
            filename <- paste0(new_id, ".csv")
            }
        
        else if (i <= 99 & i >= 10) {
            new_id <- paste0("0", i)
            filename <- paste0(new_id, ".csv") 
            } 
        
        else if (i >=100) {
            filename <- paste0(i, ".csv")
            }

        temp_df<- read.csv(filename)
        clean_df <- subset(temp_df, !is.na(temp_df[,pollutant]) &
                               !is.nan(temp_df[,pollutant]))
        temp_mean <- mean(clean_df[,pollutant], na.rm =TRUE)
        sums[i] <- sum(clean_df[pollutant])
        n[i] <- nrow(clean_df)
        i <- i + 1
    }

    new_mean <- sum(sums,na.rm =TRUE)/sum(n, na.rm =TRUE)
    new_mean

}

setwd("~/Desktop")
pollutantmean("specdata", "sulfate", 1:10)

setwd("~/Desktop")
pollutantmean("specdata", "nitrate", 70:72)

setwd("~/Desktop")
pollutantmean("specdata", "nitrate", 23)

