data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subdata <- data[grep("^[1-2]/2/2007", data$Date),]
subdata$Date_Time <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
plot(subdata$Date_Time, subdata$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subdata$Date_Time, subdata$Sub_metering_2, type = "l", col = "red")
lines(subdata$Date_Time, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1,1), col = c("black", "red", "blue"), yjust = 0.5, y.intersp = 0.7)
dev.copy(png, file = "plot3.png")
dev.off()
