##loading packages
library(data.table)
library(ggplot2)

## reading in data 
setwd("~/Desktop/eda_final_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###Question 4:
#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?

combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalcomb <- (combustion & coal)
combustion_scc <- SCC[coalcomb,]$SCC
combustion_nei <- NEI[NEI$SCC %in% combustion_scc,]

plot4 <- ggplot(combustion_nei, aes(factor(year), Emissions)) +
    geom_bar(stat="identity") + labs(title="PM2.5 Coal Combustion Source in the US",
                                     x='Year')

print(plot4)
