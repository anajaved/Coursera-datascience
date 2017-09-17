##loading packages
library(data.table)
library(ggplot2)

## reading in data 
setwd("~/Desktop/eda_final_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI)
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
