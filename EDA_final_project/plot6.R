##loading packages
library(data.table)
library(ggplot2)
library(cowplot)

## reading in data 
setwd("~/Desktop/eda_final_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time 
# in motor vehicle emissions?

vehicle_sources <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicle_scc <- SCC[vehicle_sources,]$SCC
vehicle_nei <- NEI[NEI$SCC %in% vehicle_scc,]

vehicle_nei_bmore <- subset(vehicle_nei, fips=="24510")
vehicle_nei_la <- subset(vehicle_nei, fips=="06037")

plot6_bmore <- ggplot(vehicle_nei_bmore, aes(factor(year), Emissions)) +
    geom_bar(stat="identity") + labs(title="PM2.5 Vehicle Source in Baltimore",
                                     x='Year')

plot6_la <- ggplot(vehicle_nei_la, aes(factor(year), Emissions)) +
    geom_bar(stat="identity") + labs(title="PM2.5 Vehicle Source in LA",
                                     x='Year')

plot_grid(plot6_bmore, plot6_la)
