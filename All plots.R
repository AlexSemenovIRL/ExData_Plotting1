setwd("C:/Users/alex/Desktop/Exploratory Data Analysis")
my_data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset_data <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset_data$Global_active_power)
subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subMetering3 <- as.numeric(subset_data$Sub_metering_3)




#Plot 1
hist(subset_data$Global_active_power,col="red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()


#Plot 2
plot(DataTime,subset_data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()

#Plot 3
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()

#Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime,subset_data$Global_active_power,type="l",ylab="Global Active Power")
plot(datetime,subset_data$Voltage,type="l",ylab="Voltage",xlab = "datetime")
plot(datetime,subset_data$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(datetime,subset_data$Sub_metering_2,col="red")
lines(datetime,subset_data$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime,subset_data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab = "datetime")
dev.off()




