library("data.table")
powerAllData <- fread(input = "./data/household_power_consumption.txt", na.strings="?")
powerTwoDays <- subset(powerAllData,powerAllData$Date=="1/2/2007" | powerAllData$Date =="2/2/2007")

powerTwoDays$Date <- as.Date(powerTwoDays$Date, format="%d/%m/%Y")
powerTwoDays <- transform(powerTwoDays, dateTime=as.POSIXct(paste(Date, Time)))

powerTwoDays$Sub_metering_1 <- as.numeric(as.character(powerTwoDays$Sub_metering_1))
powerTwoDays$Sub_metering_2 <- as.numeric(as.character(powerTwoDays$Sub_metering_2))
powerTwoDays$Sub_metering_3 <- as.numeric(as.character(powerTwoDays$Sub_metering_3))

png("plot3.png", width=480, height=480)
plot(powerTwoDays$dateTime,powerTwoDays$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(powerTwoDays$dateTime,powerTwoDays$Sub_metering_2, type="l",col="red")
lines(powerTwoDays$dateTime,powerTwoDays$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
