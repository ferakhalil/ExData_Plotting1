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
data_needed$Date <- as.Date(data_needed$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(data_needed$Date), data_needed$Time)
data_needed$Datetime <- as.POSIXct(dateTime)

#plot the chart

with(data_needed, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#save as png file 
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
