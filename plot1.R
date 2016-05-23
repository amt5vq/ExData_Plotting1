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

#Make the histogram, save as png

png(filename = "plot1.png", width = 480, height = 480)

hist(filtered$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()


