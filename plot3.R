#Download data from source url

filename <- "household_power_consumption.txt"

if (!file.exists(filename)) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip",method="curl")
        unzip("household_power_consumption.zip")
}

#Cast appropriate data types

cols <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

data <- read.table(filename, colClasses=cols, sep=';', header=T, na.strings='?', comment.char="")

#Filter the dates we want

filtered <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#Make the plot, save as png

png(filename = "plot3.png", width = 480, height = 480)

plot(as.POSIXct(paste(filtered$Date,filtered$Time),format="%d/%m/%Y %H:%M:%S"), filtered$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")

points(as.POSIXct(paste(filtered$Date,filtered$Time),format="%d/%m/%Y %H:%M:%S"), filtered$Sub_metering_2, type = "l", col = "red")

points(as.POSIXct(paste(filtered$Date,filtered$Time),format="%d/%m/%Y %H:%M:%S"), filtered$Sub_metering_3, type = "l", col = "blue")

legend("topright", pch = c("l","l","l"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()