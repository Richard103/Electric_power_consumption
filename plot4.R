if(!require(chron)) {
  install.packages("chron")
}
library(chron)

# the source data have to be unziped in the directory "./exdata"
my_names <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
my_data <- read.table("./exdata/household_power_consumption.txt", header = F, sep=";", nrows=2880, skip = 66637, na.strings="?")
my_date <- paste(my_data$Date, my_data$Time)

date_time <-strptime(paste(my_data$Date, my_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
col_line <- c("black", "red", "blue")

png(filename = "plot4.png")
par(mfrow = c(2,2))
# plot 1:
plot(my_data$date_time, my_data$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")

#plot 2:
plot(my_data$date_time, my_data$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")

#plot 3:
plot(my_data$date_time, my_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
points(my_data$date_time, my_data$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "")
points(my_data$date_time, my_data$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "Energy sub metering")
legend("topright", legend=labels, col=col_line, lty="solid")

#plot 4:
plot(my_data$date_time, my_data$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")

dev.off()

