# load dataset
dataset <- read.table('~/Desktop/household_power_consumption.txt', 
                      header = TRUE,
                      sep = ';')

# using data from the dates 2007-02-01 and 2007-02-02
dataset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')

png('~/Desktop/EDA/plot2.png', width = 480, height = 480)
with(dataset, plot(as.numeric(as.character(Global_active_power)),
                   type = 'l',
                   ylab = 'Global Active Power (kilowatts)',
                   xaxt = 'n',
                   xlab = ''))
axis(side = 1,
     at = c(0, floor(dim(dataset)[1] / 2), dim(dataset)[1]),
     labels=c("Thu","Fri","Sat"))
dev.off()
