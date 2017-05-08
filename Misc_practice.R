#R creating variables practice/ creating factors 

yesno <- sample(c("yes", "no"), size=10, replace=T)
yesnofac <-  factor(yesno)
relevel(yesnofac, ref="yes")

round(3.345, digits = 1)

#Reshaping data 
install.packages("Hmisc")
library(reshape2)
library(Hmisc)
data(mtcars)

mtcars$carname <- rownames(mtcars)
head(mtcars$carname, 5)

#Melting Data 
carMelt <- melt(mtcars, id=c("carname", "gear","cyl"), 
                measure.vars =c("mpg","hp"))

head(carMelt, 3)  #shows mpg variable
tail(carMelt, 3)  #shows hp variable 

#Casting Data 
cylData <- dcast(carMelt, cyl~variable, mean)
cylData  #provides mean mpg & hp for each cyl

#Averaging values
head(InsectSprays)
names(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, mean) #total counts by spray type

#Using split & lapply 
spIns <- split(InsectSprays$count, InsectSprays$spray)
sprCount <- lapply(spIns, sum)

#Combining/Simplifying results:
simplify2array(sprCount)
    #or
unlist(sprCount)
    #or
sapply(spIns, sum)

#Plyr Package to combine data
library(plyr)
ddply(InsectSprays,.(spray), summarize, sum=sum(count))

#Dplyr practice
library(dplyr)
setwd("~/Desktop")
chicago <- readRDS("chicago.rds")

head(select(chicago, city:dptp))
head(select(chicago, -(city:dptp)))

#group_by years 
new_chicago <- mutate(chicago, year=as.POSIXlt(date)$year + 1900)
years <- group_by(new_chicago, year)
summarize(years, pm25tmean2=mean(pm25tmean2, na.rm=T), o3=max(o3tmean2),
           no2= median(no2tmean2))

#pipeline operator example
#grouping summaries by month 
chicago %>% mutate(month=as.POSIXlt(date)$mon+1) %>%
    group_by(month) %>% summarise(pm25tmean2 = mean(pm25tmean2), 
                                  o3 = max(o3tmean2), no2=median(no2tmean2))

#Merging dataframes with a common id
library(plyr)
df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1,df2), id)

#merging multiple df w/ plyr
df3 <- data.frame(id=sample(1:10), z=rnorm(10))
dfList <- list(df1, df2, df3)
join_all(dfList)
