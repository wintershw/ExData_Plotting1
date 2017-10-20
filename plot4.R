# load dataset
dataset <- read.table('~/Desktop/household_power_consumption.txt', 
                      header = TRUE,
                      sep = ';')

# using data from the dates 2007-02-01 and 2007-02-02
dataset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')

png('~/Desktop/EDA/plot4.png', width = 480, height = 480)
# set to put four plots in one frame
par(mfrow = c(2, 2))

# Global Active Power
with(dataset, plot(as.numeric(as.character(Global_active_power)),
                   type = 'l',
                   ylab = 'Global Active Power (kilowatts)',
                   xaxt = 'n',
                   xlab = ''))
axis(side = 1,
     at = c(0, floor(dim(dataset)[1] / 2), dim(dataset)[1]),
     labels=c("Thu","Fri","Sat"))

# Voltage
with(dataset, plot(as.numeric(as.character(Voltage)),
                   type = 'l',
                   ylab = 'Voltage',
                   xaxt = 'n',
                   xlab = 'datetime'))
axis(side = 1,
     at = c(0, floor(dim(dataset)[1] / 2), dim(dataset)[1]),
     labels=c("Thu","Fri","Sat"))

# energy sub metering
with(dataset, { 
    plot(as.numeric(as.character(Sub_metering_1)),
         type = 'l',
         ylab = 'Energy sub meeting',
         xaxt = 'n',
         xlab = '')
    lines(as.numeric(as.character(Sub_metering_2)),
          col = 'red')
    lines(as.numeric(as.character(Sub_metering_3)),
          col = 'blue')})
axis(side = 1,
     at = c(0, floor(dim(dataset)[1] / 2), dim(dataset)[1]),
     labels=c("Thu","Fri","Sat"))
legend('topright', 
       col = c('black', 'red', 'blue'),
       lty = c(1, 1, 1),
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

# global reactive power
with(dataset, plot(as.numeric(as.character(Global_reactive_power)),
                   type = 'l',
                   ylab = 'Global_reactive_power',
                   xaxt = 'n',
                   xlab = 'datetime'))
axis(side = 1,
     at = c(0, floor(dim(dataset)[1] / 2), dim(dataset)[1]),
     labels=c("Thu","Fri","Sat"))

dev.off()
