## Exploratory Data Analysis
## Course Project #2 - Question 6
## November 2015


## Set working Directory and call needed libraries
setwd("~/Desktop/Johns Hopkins - Data Science Certification/04_Exploratory Data Analysis/Course Project 2")
library(ggplot2)
library(plyr)

## Read the two data sets from the EPA National Emissions Inventory web site using redRDS()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extract only emission data from Baltimore City, Maryland and Los Angeles County, California from motor vehicle sources.

baltimore_emission <- subset(NEI, fips == "24510")
losang_emission <- subset(NEI, fips =="06037")

vehicle_emissions <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicle_emissions,]$SCC

vehicles_baltimore <- baltimore_emission[baltimore_emission$SCC %in% vehiclesSCC, ]
vehicles_baltimore$city <- "Baltimore City"
vehicles_losang <- losang_emission[losang_emission$SCC %in% vehiclesSCC, ]
vehicles_losang$city <- "Los Angeles County"

two_cities <- rbind(vehicles_baltimore, vehicles_losang)

## Plot the answer to Question 6:
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

png("plot6.png")
ggplot(two_cities, aes(factor(year), y=Emissions, fill=city)) +
  geom_bar(stat="identity",aes(fill=year)) +
  facet_grid(scales="free", space="free", .~city) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y='Total PM2.5 Emissions (tons) caused by motor vehicle sources') + 
  labs(title=expression('Question 6'))
dev.off()
