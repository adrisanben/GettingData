#Pregunta 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, dest="/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/GettingData/surveydata.csv", method = "curl")
surveydata <- read.csv("surveydata.csv")
splitnames <- strsplit(names(surveydata), "wgtp")
splitnames[123]

#Pregunta 2
library(dplyr)
library(data.table)
library(gsubfn)
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl2, dest="/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/GettingData/GrossDomProd.csv", method = "curl")
gdp <- read.csv("GrossDomProd.csv", nrows = 190, skip = 4)
gdp <- gdp[ , c(1,2,4,5)]
colnames(gdp) <- c("CountryCode","Rank", "Country", "Total")
numbers <- as.integer(gsubfn(",","",gdp[,"Total"]))
mean(numbers, na.rm = T)

#Pregunta 4
fileURL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL3, destfile = "/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/GettingData/ED.csv", method = "curl")
ed <- read.csv("ED.csv")
merged <- merge(gdp, ed, by = "CountryCode")
fyejune <- grep("Fiscal year end: June", merged)

#Pregunta 5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
length(amzn2012)
mon2012 <- amzn2012[weekdays(amzn2012)== "Monday"]
length(mon2012)







