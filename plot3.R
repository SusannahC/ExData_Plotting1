
### We will only be using data from the dates 2007-02-01 and 2007-02-02

hpcData <- read.table("./household_power_consumption.txt", sep=';', header=TRUE, na.strings="?")
hpcData <- hpcData[hpcData$Date %in% c("1/2/2007","2/2/2007"), ]

hpcData$datetime <- strptime(paste(hpcData$Date, hpcData$Time), "%d/%m/%Y %H:%M:%S")

## Plot
png("plot3.png", width=480, height=480)
plot(hpcData$datetime, hpcData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpcData$datetime, hpcData$Sub_metering_2, col="red")
lines(hpcData$datetime, hpcData$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()