##loading packages
library(data.table)
library(ggplot2)

## reading in data 
setwd("~/Desktop/eda_final_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###Question 2:
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to mak
#e a plot answering this question.

baltimore_data <- subset(NEI,NEI$fips==24510)
total_by_year_bmore <- with(baltimore_data,tapply(Emissions,year,sum,na.rm=TRUE)) 

par(mar=c(4,4,2,2))
plot(names(total_by_year_bmore), total_by_year_bmore/(10^6), pch=19, xlab="Year", 
     ylab="PM2.5 Emissions (millions)", main="Total PM2.5 Emissions by Year in B
     altimore")
