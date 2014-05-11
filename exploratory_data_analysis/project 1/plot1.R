# Run as: 
#
# Rscript plot1.R 
#
# Read the data from the provided file after unzipping
data <- read.table('household_power_consumption.txt', sep=';', header=T, na.strings='?')

# convert the date column
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# filter on the two provided date's
mydata <- data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

# open plot1.png file
png("plot1.png", height=480, width=480)

# create the histogram with title etc.
hist(mydata$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

# write plot1.png file
dev.off()


