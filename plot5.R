## Exploratory Data Analysis
## Course Project #2 - Question 5
## November 2015


## Set working Directory and call needed libraries
setwd("~/Desktop/Johns Hopkins - Data Science Certification/04_Exploratory Data Analysis/Course Project 2")
library(ggplot2)
library(plyr)

## Read the two data sets from the EPA National Emissions Inventory web site using redRDS()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extract only emission data from Balitmore City, Maryland and from motor vehicle sources.

baltimore_emission <- subset(NEI, fips == "24510")

vehicle_emissions <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicle_emissions,]$SCC
vehicles_baltimore <- baltimore_emission[baltimore_emission$SCC %in% vehiclesSCC,]

## Plot the answer to Question 5:
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

png("plot5.png")
ggplot(vehicles_baltimore,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y='Total PM2.5 Emissions (tons) caused by motor vehicle sources in Baltimore') + 
  labs(title=expression('Question 5'))
dev.off()
