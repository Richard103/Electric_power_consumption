if(!require(chron)) {
  install.packages("chron")
}
library(chron)

# the source data have to be unziped in the directory "./exdata"
my_names <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
my_data <- read.table("./exdata/household_power_consumption.txt", header = F, sep=";", nrows=2880, skip = 66637, na.strings="?")
my_date <- paste(my_data$Date, my_data$Time)

date_time <-strptime(paste(my_data$Date, my_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png")
hist(my_data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()