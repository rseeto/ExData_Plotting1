##Code to emulate Plot 2 from Course Project 1 of "Exploratory Data Analysis"

##checks to see if data is available
if(!file.exists("household_power_consumption.txt")){
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata_data_household_power_consumption.zip")
    unzip("exdata_data_household_power_consumption.zip")
}

##reads and subsets data
foo <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
foo1 <- subset(foo, Date == "1/2/2007" | Date == "2/2/2007")
foo1$Date <- strptime(paste(foo1$Date,foo1$Time), "%d/%m/%Y %H:%M:%S")

##creates png from plot
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(foo1$Date, foo1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()