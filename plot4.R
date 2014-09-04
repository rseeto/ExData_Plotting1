##Code to emulate Plot 4 from Course Project 1 of "Exploratory Data Analysis"

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
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
plot(foo1$Date, foo1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(foo1$Date, foo1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(foo1$Date, foo1$Sub_metering_2, type = "l", col = "red")
lines(foo1$Date, foo1$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n")
plot(foo1$Date, foo1$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(foo1$Date, foo1$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()