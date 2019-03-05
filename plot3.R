library(lubridate)

# Read the data 
df <- read.table('household_power_consumption.txt', sep=';', header=TRUE, na.strings='?', colClasses = c(rep('character', 2), rep('numeric',7)))
df$Date <- dmy(df$Date)
mydf <- df[grep('2007-02-01|2007-02-02', df$Date), ]

# Creating the time column
mydf$date_time <- ymd_hms(paste(mydf$Date, mydf$Time, sep=' '))

# Make the graph
png(filename = 'plot3.png')
par(mar=c(4,5,2,2))
with(mydf, plot(x=date_time, y=Sub_metering_1, ylab='Energy sub metering', xlab='', type='l'))
lines(x=mydf$date_time, y=mydf$Sub_metering_2, col='red')
lines(x=mydf$date_time, y=mydf$Sub_metering_3, col='blue')
legend('topright', lty=1, col=c('black','red','blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()