# Reading data
file <- "household_power_consumption.txt"
rawdata <- read.csv(file, sep=';', na.strings = "?")
head(rawdata)
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
data <- subset(rawdata, Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))
png(file="plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global active power")
dev.off()
