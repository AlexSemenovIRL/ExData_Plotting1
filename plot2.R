setwd("C:/Users/alex/Desktop/Exploratory Data Analysis")
options(stringsAsFactors = F)
my_data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset_data <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007"),]
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

DataTime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(DataTime,subset_data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
