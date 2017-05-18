#Week 4 Cleaning Data 

### American Community Survey Data
#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#value of the 123 element of the resulting strsplit() list?

setwd("~/Desktop")
data <- read.csv("community_data.csv", sep=",", header=T)
splitNames = strsplit(names(data), "wgtp")
splitNames[[123]]  #[1] ""   "15"

### GDP
# Remove the commas from the GDP numbers in millions of dollars and average them.
library(RCurl)
gdp <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", 
              ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
gdp_df <- read.csv(textConnection(gdp), header=T, skip = 4, nrows = 215)
gdp_vals <- gsub(",", "", gdp_df$X.4)
gdp_vals = as.numeric(gdp_vals)
mean(gdp_vals, na.rm = T)  #[1] 377652.4

#Finding the no. of countries that begin with "United"
length(grep("^United",gdp_df$X.3))  #3

###Educational Data
# Of the fiscal year's that are available, how many end in June?
edu <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", 
              ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
edu_df <- read.csv(textConnection(edu), header=T)
combined <- merge(edu_df, gdp_df, by.x = c("CountryCode"), by.y = c("X"), all.x= TRUE)

FY_end_in_June <- combined[grepl("Fiscal year end: June 30;", combined$Special.Notes),]
nrow(FY_end_in_June) #13 

