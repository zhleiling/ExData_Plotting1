# read and subset data

data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)
subData <- subset(data, Date == "1/2/2007"| Date == "2/2/2007")

#set locale
Sys.setlocale("LC_TIME", "English")

#plot

x <- strptime(paste(subData$Date, subData$Time), format = "%d/%m/%Y %H:%M:%S")
y1 <- as.numeric(subData$Sub_metering_1)
y2 <- as.numeric(subData$Sub_metering_2)
y3 <- as.numeric(subData$Sub_metering_3)
png("plot3.png", width = 480, height = 480)

plot(x, y1 ,type="l", xlab ="", ylab = "Energy Sub metering")
points(x, y2 ,type="l", col = "Red")
points(x, y3 ,type="l", col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1)

dev.off()

#clean
rm(list = ls())