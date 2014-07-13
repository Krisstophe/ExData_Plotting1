data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subdata <- data[grep("^[1-2]/2/2007", data$Date),]
subdata$Date_Time <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
hist(as.numeric(subdata$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()