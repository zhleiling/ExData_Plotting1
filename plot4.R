# read and subset data

data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)
subData <- subset(data, Date == "1/2/2007"| Date == "2/2/2007")


#plot

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
x <- strptime(paste(subData$Date, subData$Time), format = "%d/%m/%Y %H:%M:%S")
y <- as.numeric(subData$Global_active_power)
plot(x, y, type = "l", xlab = "", ylab = "Global Active Power")

y <- as.numeric(subData$Voltage)
plot(x, y, type = "l", xlab = "datetime", ylab = "Voltage")

y1 <- as.numeric(subData$Sub_metering_1)
y2 <- as.numeric(subData$Sub_metering_2)
y3 <- as.numeric(subData$Sub_metering_3)
plot(x, y1 ,type="l", xlab ="", ylab = "Energy Sub metering")
points(x, y2 ,type="l", col = "Red")
points(x, y3 ,type="l", col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1, bty = "n")

y <- as.numeric(subData$Global_reactive_power)
plot(x, y, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

#clean
rm(list = ls())