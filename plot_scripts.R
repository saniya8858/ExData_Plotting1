setwd("C:/Users/ASUS/Documents/ExData_Plotting1")

library(ggplot2)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_filtered <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

data_filtered$DateTime <- strptime(paste(data_filtered$Date, data_filtered$Time), 
                                   format="%Y-%m-%d %H:%M:%S")

data_filtered$Global_active_power <- as.numeric(data_filtered$Global_active_power)

png("plot1.png", width=480, height=480)
hist(data_filtered$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

png("plot2.png", width=480, height=480)
plot(data_filtered$DateTime, data_filtered$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

png("plot3.png", width=480, height=480)
plot(data_filtered$DateTime, as.numeric(data_filtered$Sub_metering_1), 
     type="l", ylab="Energy sub metering", xlab="")
lines(data_filtered$DateTime, as.numeric(data_filtered$Sub_metering_2), col="red")
lines(data_filtered$DateTime, as.numeric(data_filtered$Sub_metering_3), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data_filtered$DateTime, data_filtered$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

plot(data_filtered$DateTime, as.numeric(data_filtered$Voltage), 
     type="l", xlab="datetime", ylab="Voltage")

plot(data_filtered$DateTime, as.numeric(data_filtered$Sub_metering_1), 
     type="l", xlab="", ylab="Energy sub metering")
lines(data_filtered$DateTime, as.numeric(data_filtered$Sub_metering_2), col="red")
lines(data_filtered$DateTime, as.numeric(data_filtered$Sub_metering_3), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n")

plot(data_filtered$DateTime, as.numeric(data_filtered$Global_reactive_power), 
     type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
