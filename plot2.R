
### We will only be using data from the dates 2007-02-01 and 2007-02-02

hpcData <- read.table("./household_power_consumption.txt", sep=';', header=TRUE, na.strings="?")
hpcData <- hpcData[hpcData$Date %in% c("1/2/2007","2/2/2007"), ]

hpcData$datetime <- strptime(paste(hpcData$Date, hpcData$Time), "%d/%m/%Y %H:%M:%S")

## Plot
png("plot2.png", width=480, height=480)
plot(hpcData$datetime, hpcData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()