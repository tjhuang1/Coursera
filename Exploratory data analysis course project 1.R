#plot1
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
gap <- as.numeric(subsetdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active power")
dev.off()
#plot2
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, gap, type = "l",xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
#plot3
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subsetdata$Global_active_power)
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime, submetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, 
       col = c("black", "red", "blue"))
dev.off()
#plot4
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subsetdata$Global_active_power)
submetering1 <- as.numeric(subsetdata$Sub_metering_1)
submetering2 <- as.numeric(subsetdata$Sub_metering_2)
submetering3 <- as.numeric(subsetdata$Sub_metering_3)
gcp <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(datetime, gap, type = "l", ylab = "Global Active Power", xlab = "", cex = 0.2)
plot(datetime, voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(datetime, submetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, 
       col = c("black", "red", "blue"), bty = "o")
plot(datetime, gcp, type = "l", ylab = "Global Reactive Power", xlab = "datetime")

dev.off()
