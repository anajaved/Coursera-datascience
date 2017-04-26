#download files -- Idaho Housing Data 
setwd("~/Desktop")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, 
              destfile = "~/Desktop/community_data.csv", method="curl")
data <- read.table("~/Desktop/community_data.csv", sep=",", header=T)
str(data)

#How many properties >= $1,000,000? 
greater <- subset(data, data$VAL >= 24)
dim(greater)  #53

#Which process is fastest?
library(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, 
              destfile = "~/Desktop/community_data.csv", method="curl")
DT <- fread(input="~/Desktop/community_data.csv", sep=",")
system.time(mean(DT$pwgtp15,by=DT$SEX))


#Natural Gas Aquisition Program Questions:
library(xlsx)
download.file(xlsxURL, 
              destfile = "~/Desktop/natural_gas_data.csv", method="curl")
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("~/Desktop/natural_gas_data.csv", sheetIndex=1, 
                 colIndex=colIndex, rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T) #36534720

#Number of Baltimore Restaurants with zipcode 21231:
library(XML)
xmlURL <-"http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
bmore_doc <- xmlTreeParse(xmlURL, useInternal=TRUE)
rootNode <- xmlRoot(bmore_doc)
total <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(total[total ==21231]) #127



