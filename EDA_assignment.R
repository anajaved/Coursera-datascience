#week 3- EDA assignment

##American Community Survey Data
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

##Reading JPEG into R & obtaining 30th, 80th percentile 
library(jpeg)
setwd("~/Desktop")
jpeg_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(jpeg_url, destfile = "~/Desktop/image.jpeg", method = "curl")
image <- readJPEG('image.jpeg', native=T)
quantile(image, probs=c(0.3, 0.8))  #-15259150 -10575416 

