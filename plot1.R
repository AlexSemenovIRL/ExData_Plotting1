setwd("C:/Users/alex/Desktop/Exploratory Data Analysis")
options(stringsAsFactors = F)
my_data <- read.table("household_power_consumption.txt", header=T, sep=";")
subset_data <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007"),]
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power,col="red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
