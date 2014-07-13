data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subdata <- data[grep("^[1-2]/2/2007", data$Date),]
subdata$Date_Time <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
plot(subdata$Date_Time, subdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()