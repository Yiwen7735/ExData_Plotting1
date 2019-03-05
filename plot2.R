library(lubridate)

# Read the data 
df <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?', colClasses = c(rep('character', 2), rep('numeric',7)))
df$Date <- dmy(df$Date)
mydf <- df[grep('2007-02-01|2007-02-02', df$Date), ]

# Creating the time column
mydf$date_time <- ymd_hms(paste(mydf$Date, mydf$Time, sep=' '))

# Make the graph
png(filename = 'plot2.png')
par(mar=c(4,5,2,2))
plot(x=mydf$date_time, y=mydf$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', type='l')
dev.off()