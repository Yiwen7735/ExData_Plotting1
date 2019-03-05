library(lubridate)

# Read the data 
df <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?', colClasses = c(rep('character', 2), rep('numeric',7)))
df$Date <- dmy(df$Date)
mydf <- df[grep('2007-02-01|2007-02-02', df$Date), ]

# Creating the time column
mydf$date_time <- ymd_hms(paste(mydf$Date, mydf$Time, sep=' '))

# Make the graph
png(filename = 'plot4.png')
par(mfcol=c(2,2), mar=c(4,4,2,1))
plot(x=mydf$date_time, y=mydf$Global_active_power, xlab='', ylab='Global Active Power', type='l')

with(mydf, {plot(x=date_time, y=Sub_metering_1, ylab='Energy sub metering', xlab='', type='l')
lines(x=date_time, y=Sub_metering_2, col='red')
lines(x=date_time, y=Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black','red','blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))})

plot(x=mydf$date_time, y=mydf$Voltage, xlab='datetime', ylab='Voltage', type='l')
plot(x=mydf$date_time, y=mydf$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')

dev.off()