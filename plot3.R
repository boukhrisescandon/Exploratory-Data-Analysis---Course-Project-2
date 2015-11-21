## Exploratory Data Analysis
## Course Project #2 - Question 3
## November 2015


## Set working Directory and call needed libraries
setwd("~/Desktop/Johns Hopkins - Data Science Certification/04_Exploratory Data Analysis/Course Project 2")
library(ggplot2)
library(plyr)

## Read the two data sets from the EPA National Emissions Inventory web site using redRDS()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extract only emission data from Balitmore City, Maryland.
## Use ddply() to calculate the sum of the emissions per year from Baltimore City, Maryland for each 
## type (point, nonpoint, onraod, nonroad)

baltimore_emission <- subset(NEI, fips == "24510")
total_emissions <- ddply(baltimore_emission, .(year, type), function(x) sum(x$Emissions))
colnames(total_emissions) [3] <- "Emissions"   #name the column names of our total_emission data set

## Plot the answer to Question 3:
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
## a plot answer this question.

png("plot3.png")
qplot(total_emissions$year,
      total_emissions$Emissions,
      color = total_emissions$type,
      geom = 'line') + 
  ggtitle('Question 3') +
  xlab("Year") +
  ylab("Total PM2.5 Emissions (tons) in Baltimore")
dev.off()