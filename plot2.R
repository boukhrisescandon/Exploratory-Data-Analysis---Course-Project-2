## Exploratory Data Analysis
## Course Project #2 - Question 2
## November 2015


## Set working Directory
setwd("~/Desktop/Johns Hopkins - Data Science Certification/04_Exploratory Data Analysis/Course Project 2")

## Read the two data sets from the EPA National Emissions Inventory web site using redRDS()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extract only emission data from Balitmore City, Maryland.
## Use aggregate() to calculate the sum of the emissions per year from Baltimore City, Maryland

baltimore_emission <- subset(NEI, fips == "24510")
total_emissions <- aggregate(Emissions ~ year, baltimore_emission, sum)

## Plot the answer to Question 2:
## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
## system to make a plot answering this question.

png("plot2.png")
barplot(total_emissions$Emissions,
        names.arg = total_emissions$year,
        xlab = 'Year',
        ylab = 'Total PM2.5 Emissions (tons) in Baltimore',
        main = 'Question 2')
dev.off()

