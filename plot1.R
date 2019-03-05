library(lubridate)

# Read the data 
df <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?', colClasses = c(rep('character', 2), rep('numeric',7)))
df$Date <- dmy(df$Date)
mydf <- df[grep('2007-02-01|2007-02-02', df$Date), ]

# Make the graph

png(filename = 'plot1.png')
par(mar=c(4,5,2,2))
hist(mydf$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', ylab='Frequency', main='Global Active Power')
dev.off()
