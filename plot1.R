## Exploratory Data Analysis
## Course Project #2 - Question 1
## November 2015


## Set working Directory
setwd("~/Desktop/Johns Hopkins - Data Science Certification/04_Exploratory Data Analysis/Course Project 2")

## Read the two data sets from the EPA National Emissions Inventory web site using redRDS()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Use aggregate() to calculate the sum of the emissions per year from all sources

total_emissions <- aggregate(Emissions ~ year, NEI, sum)

## Plot the answer to Question 1:
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

png("plot1.png")
barplot(total_emissions$Emissions, 
        names.arg=total_emissions$year, 
        xlab = 'Year', 
        ylab = 'Total PM2.5 Emissions (tons)',
        main = 'Question 1')
dev.off()
