
### We will only be using data from the dates 2007-02-01 and 2007-02-02

hpcData <- read.table("./household_power_consumption.txt", sep=';', header=TRUE, na.strings="?")
hpcData <- hpcData[hpcData$Date %in% c("1/2/2007","2/2/2007"), ]

hpcData$datetime <- strptime(paste(hpcData$Date, hpcData$Time), "%d/%m/%Y %H:%M:%S")

## Plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## top left plot
plot(hpcData$datetime, hpcData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## top right plot
plot(hpcData$datetime, hpcData$Voltage, type="l", xlab="datetime", ylab="Voltage")

## bottom left plot
plot(hpcData$datetime, hpcData$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(hpcData$datetime, hpcData$Sub_metering_2, col="red")
lines(hpcData$datetime, hpcData$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

## bottom right plot
plot(hpcData$datetime, hpcData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
