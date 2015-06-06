data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

png("plot3.png", width = 480, height=480)
plot(data$Time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Time,data$Sub_metering_2, type="l", col="red")
lines(data$Time,data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue") )
dev.off()