# read and subset data

data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)
subData <- subset(data, Date == "1/2/2007"| Date == "2/2/2007")


#plot

x <- strptime(paste(subData$Date, subData$Time), format = "%d/%m/%Y %H:%M:%S")
y <- as.numeric(subData$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()

#clean
rm(list = ls())