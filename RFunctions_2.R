#Write a function that reads a directory full of files and reports the number 
#of completely observed cases in each data file. The function should return a 
#data frame where the first column is the name of the file and the second column 
#is the number of complete cases. A prototype of this function follows


complete <- function (directory, id=1:332) {
    setwd(directory)
    d = NULL
    
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
        
        temp_df<- read.csv(filename, header=T)
        nobs <- sum(complete.cases(temp_df), na.rm = T)
        d = rbind(d, data.frame(i, nobs))
    }
    print (d)

}

setwd("~/Desktop")
complete("specdata", c(2, 4, 8, 10, 12))

setwd("~/Desktop")
complete("specdata", id=1)

setwd("~/Desktop")
complete("specdata", 30:25)

setwd("~/Desktop")
complete("specdata", 3)
