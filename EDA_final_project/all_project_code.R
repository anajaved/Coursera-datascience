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

head(NEI)
str(total_by_year)
names(total_by_year)
mean_by_year <- with(NEI,tapply(Emissions,year,mean,na.rm=TRUE)) 
total_by_year <- with(NEI,tapply(Emissions,year,sum,na.rm=TRUE)) 

par(mar=c(4,4,2,2))
plot(names(total_by_year), total_by_year/(10^6), pch=19, xlab="Year", 
     ylab="PM2.5 Emissions (by millions)", main="Total PM2.5 Emissions by Year")


###Question 2:
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to mak
#e a plot answering this question.

baltimore_data <- subset(NEI,NEI$fips==24510)
total_by_year_bmore <- with(baltimore_data,tapply(Emissions,year,sum,na.rm=TRUE)) 

par(mar=c(4,4,2,2))
plot(names(total_by_year_bmore), total_by_year_bmore/(10^6), pch=19, xlab="Year", 
     ylab="PM2.5 Emissions (millions)", main="Total PM2.5 Emissions by 
     Year in Baltimore")

#Question 3
#Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onro
#ad, nonroad) variable, which of these four sources have seen decreases in 
#emissions from 1999–2008 for Baltimore City? Which have seen increases in 
#emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer 
#this question.
baltimore_data <- subset(NEI,NEI$fips==24510)
names(baltimore_data)

plot_3 <- ggplot(baltimore_data, aes(factor(year), Emissions)) + geom_bar(stat="identity") +
    facet_grid(.~type) + labs(x="Year", y="Emissions", title="Emissions Across the Years in Baltimore by Type")

print(plot_3)


## Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time 
# in motor vehicle emissions?

vehicle_sources <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle_scc <- SCC[vehicle_sources,]$SCC
vehicle_nei <- NEI[NEI$SCC %in% vehicle_scc,]

vehicle_nei_bmore <- subset(vehicle_nei, fips==24510)


