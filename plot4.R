## Exploratory Data Analysis
## Course Project #2 - Question 4
## November 2015


## Set working Directory and call needed libraries
setwd("~/Desktop/Johns Hopkins - Data Science Certification/04_Exploratory Data Analysis/Course Project 2")
library(ggplot2)
library(plyr)

## Read the two data sets from the EPA National Emissions Inventory web site using redRDS()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Extract only emission data from coal combustion-related sources

combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coal_combustion <- (combustion & coal)
combustionSCC <- SCC[coal_combustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

## Plot the answer to Question 4:
## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

png("plot4.png")
ggplot(combustionNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y='Total PM2.5 Emissions (tons) caused by coal combustion related sources') + 
  labs(title=expression('Question 4'))
dev.off()