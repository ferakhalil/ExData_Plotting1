#
# Exploratory Data Analysis Assignment 1
#
# Make sure environment variable for tokens exists in home directory

rm(list=ls())
# 
#  
library(pacman)

#check directory and create
getwd() 
setwd("D:/My Documents/Coursera/John Hopkins Specialization in Data Science/Exploratory Data Analysis/Assignment 1")

fileLocation <- "D:/My Documents/Coursera/John Hopkins Specialization in Data Science/Exploratory Data Analysis/Assignment 1/exdata_data_household_power_consumption.zip"

#unzip the files
unzip(fileLocation,  exdir="./data", overwrite=TRUE)


#read the data
complete_data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subset necessary data
data_needed <- subset(complete_data, Date %in% c("1/2/2007","2/2/2007"))

#plot the data as histogram
data_needed$Date <- as.Date(data_needed$Date, format="%d/%m/%Y")
hist(data_needed$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save as png file
png("plot1.png", width=480, height=480)
dev.off()
