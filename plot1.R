if(!file.exists("household_power_consumption.txt")){
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata_data_household_power_consumption.zip")
    unzip("exdata_data_household_power_consumption.zip")
}

foo <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
foo1 <- subset(foo, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(foo1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()