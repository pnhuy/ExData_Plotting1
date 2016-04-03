# Reading data
file <- "household_power_consumption.txt"
rawdata <- read.csv(file, sep=';', na.strings = "?")
head(rawdata)
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
data <- subset(rawdata, Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))
png(file="plot3.png")
power <- data$Global_active_power
timestamps <- as.POSIXct(paste(data$Date, data$Time))
plot(timestamps, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering")
lines(timestamps, data$Sub_metering_2, type="l", col = "red")
lines(timestamps, data$Sub_metering_3, type="l", col = "purple")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red","purple"), lwd = 1, lty = c(1,1,1))
dev.off()
