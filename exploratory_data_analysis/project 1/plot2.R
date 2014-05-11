# Run as: 
#
# Rscript plot2.R 
#
# Read the data from the provided file after unzipping
data <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?')

# combine Date and Time columns
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# convert the date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# filter on the two provided date's
mydata <- data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]


# open plot2.png file
png("plot2.png", height=480, width=480)

# create the plot 
plot(mydata$DateTime, mydata$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)") 
lines(mydata$DateTime, mydata$Global_active_power)

# write plot2.png file
dev.off()
