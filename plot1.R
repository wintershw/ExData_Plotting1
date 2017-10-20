# load dataset
dataset <- read.table('~/Desktop/household_power_consumption.txt', 
                      header = TRUE,
                      sep = ';')

# using data from the dates 2007-02-01 and 2007-02-02
dataset <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')

png('~/Desktop/EDA/plot1.png', width = 480, height = 480)
with(dataset, hist(as.numeric(as.character(Global_active_power)),
                   col = 'red',
                   xlab = 'Global Active Power (kilowatts)',
                   ylab = 'Frequency',
                   main = 'Global Active Power'))
dev.off()
