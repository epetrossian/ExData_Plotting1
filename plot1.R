data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

png("plot1.png", width = 480, height=480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power", col = "red", )
dev.off()

