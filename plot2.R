# Reading data
file <- "household_power_consumption.txt"
rawdata <- read.csv(file, sep=';', na.strings = "?")
head(rawdata)
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
data <- subset(rawdata, Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))
png(file="plot2.png")
power <- data$Global_active_power
timestamps <- as.POSIXct(paste(data$Date, data$Time))
plot(timestamps, power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
