#Week 3- EDA assignment

### American Community Survey Data
#logical vector identifying housholds on >10 acres who sold more than $10k products

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, 
              destfile = "~/Desktop/community_data.csv", method="curl")
data <- read.table("~/Desktop/community_data.csv", sep=",", header=T)

library(dplyr)
agricultureLogical <- filter(data, ACR ==3 & AGS ==6)
    #or
agricultureLogical1 <- data[which(data$ACR ==3 & data$AGS ==6),]
head(agricultureLogical1,3)  #125, 238, 262

### Reading JPEG into R & obtaining 30th, 80th percentile 
library(jpeg)
setwd("~/Desktop")
jpeg_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(jpeg_url, destfile = "~/Desktop/image.jpeg", method = "curl")
image <- readJPEG('image.jpeg', native=T)
quantile(image, probs=c(0.3, 0.8))  #-15259150 -10575416 

### Worldbank GDP Data & Education data
#merging on country shortcode 
library(RCurl)
gdp <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", 
              ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
gdp_df <- read.csv(textConnection(gdp), header=T, skip = 4, nrows = 215)

edu <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", 
              ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
edu_df <- read.csv(textConnection(edu), header=T)

names(edu_df) #"CountryCode"
names(gdp_df) #X

combined <- merge(edu_df, gdp_df, by.x = c("CountryCode"), by.y = c("X"), all.x= TRUE)
clean_combined <- arrange(combined, desc(X.1))
length(!is.na(unique(clean_combined$X.1))) #189 unique matches 
clean_combined[13,]  #St. Kitts and Nevis
 
#average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
names(clean_combined)
clean_combined %>% group_by(Income.Group) %>% summarize(X.1 = mean(X.1, na.rm=T))
        #32.96667, 91.91304

#Put GDP ranks in 5 quantile groups. Make a table versus Income.Group. How many countries
#are Lower middle income but among the 38 nations with highest GDP?
library(Hmisc)
clean_combined$my_groups <- cut2 (clean_combined$X.1, g=5)
table(clean_combined$my_groups, clean_combined$Income.Group)
#5 
