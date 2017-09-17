##loading packages
library(data.table)
library(ggplot2)

## reading in data 
setwd("~/Desktop/eda_final_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###Question 5:
#How have emissions from motor vehicle sources changed from 1999–2008 
#in Baltimore City?

vehicle_sources <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle_scc <- SCC[vehicle_sources,]$SCC
vehicle_nei <- NEI[NEI$SCC %in% vehicle_scc,]

vehicle_nei_bmore <- subset(vehicle_nei, fips==24510)

plot5 <- ggplot(vehicle_nei_bmore, aes(factor(year), Emissions)) +
    geom_bar(stat="identity") + labs(title="PM2.5 Vehicle Source in Baltimore City",
                                     x='Year')

print(plot5)
