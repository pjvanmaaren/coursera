# Run as: 
#
# Rscript plot4.R 
#
# Read the data from the provided file after unzipping
data <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?')

# combine Date and Time columns
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# convert the date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# filter on the two provided date's
mydata <- data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

# open plot4.png file
png("plot4.png", height=480, width=480)

# create the multi panel plot 
par(mfrow=c(2,2))

# Global Active Power plot
plot(mydata$DateTime, mydata$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(mydata$DateTime, mydata$Global_active_power)

# Voltage plot
plot(mydata$DateTime, mydata$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(mydata$DateTime, mydata$Voltage)

# Submetering plot
plot(mydata$DateTime, mydata$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(mydata$DateTime, mydata$Sub_metering_1)
lines(mydata$DateTime, mydata$Sub_metering_2, col='red')
lines(mydata$DateTime, mydata$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

# Global reactive power plot
with(mydata, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(mydata, lines(DateTime, Global_reactive_power))

# write plot4.png file
dev.off()


