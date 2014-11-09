# read and subset data

data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)
subData <- subset(data, Date == "1/2/2007"| Date == "2/2/2007")


#plot

x <- as.numeric(subData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(x, col = "Red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()

#clean
rm(list = ls())