##loading packages
library(data.table)
library(ggplot2)

## reading in data 
setwd("~/Desktop/eda_final_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###Question 1:
# Have total emissions from PM2.5 decreased in the 
# United States from 1999 to 2008? Using the base plotting 
# system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

total_by_year <- with(NEI,tapply(Emissions,year,sum,na.rm=TRUE)) 

par(mar=c(4,4,2,2))
plot(names(total_by_year), total_by_year/(10^6), pch=19, xlab="Year", 
     ylab="PM2.5 Emissions (by millions)", main="Total PM2.5 Emissions by Year")
