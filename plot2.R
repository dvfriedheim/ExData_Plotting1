library("data.table")
powerAllData <- fread(input = "./data/household_power_consumption.txt", na.strings="?")
powerTwoDays <- subset(powerAllData,powerAllData$Date=="1/2/2007" | powerAllData$Date =="2/2/2007")

powerTwoDays$Date <- as.Date(powerTwoDays$Date, format="%d/%m/%Y")
powerTwoDays <- transform(powerTwoDays, dateTime=as.POSIXct(paste(Date, Time)))

powerTwoDays$Global_active_power <- as.numeric(as.character(powerTwoDays$Global_active_power))

png("plot2.png", width=480, height=480)
plot(powerTwoDays$dateTime,powerTwoDays$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
