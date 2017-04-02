## read in data quickly
library("data.table")
powerAllData <- fread(input = "./data/household_power_consumption.txt", na.strings="?")
powerTwoDays <- subset(powerAllData,powerAllData$Date=="1/2/2007" | powerAllData$Date =="2/2/2007")

## add combined dateTime variable
powerTwoDays$Date <- as.Date(powerTwoDays$Date, format="%d/%m/%Y")
powerTwoDays <- transform(powerTwoDays, dateTime=as.POSIXct(paste(Date, Time)))

## all transformations
powerTwoDays$Global_active_power <- as.numeric(as.character(powerTwoDays$Global_active_power))
powerTwoDays$Voltage <- as.numeric(as.character(powerTwoDays$Voltage))
powerTwoDays$Sub_metering_1 <- as.numeric(as.character(powerTwoDays$Sub_metering_1))
powerTwoDays$Sub_metering_2 <- as.numeric(as.character(powerTwoDays$Sub_metering_2))
powerTwoDays$Sub_metering_3 <- as.numeric(as.character(powerTwoDays$Sub_metering_3))
powerTwoDays$Global_reactive_power <- as.numeric(as.character(powerTwoDays$Global_reactive_power))

## 2x2 plots as png
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
##upper left plot
plot(powerTwoDays$dateTime,powerTwoDays$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")
##upper right plot
plot(powerTwoDays$dateTime,powerTwoDays$Voltage, type="l", xlab="datetime",ylab="Voltage")
##lower left plot
plot(powerTwoDays$dateTime,powerTwoDays$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(powerTwoDays$dateTime,powerTwoDays$Sub_metering_2, type="l",col="red")
lines(powerTwoDays$dateTime,powerTwoDays$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,bty="n",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##lower right plot
plot(powerTwoDays$dateTime,powerTwoDays$Global_reactive_power, type="l", xlab="datetime",ylab="Global_reactive_power")
dev.off()