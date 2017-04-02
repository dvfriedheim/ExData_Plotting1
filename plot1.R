library("data.table")
powerAllData<-fread(input = "./data/household_power_consumption.txt", na.strings="?")
powerTwoDays<-subset(powerAllData,powerAllData$Date=="1/2/2007" | powerAllData$Date =="2/2/2007")

powerTwoDays$Global_active_power <- as.numeric(as.character(powerTwoDays$Global_active_power))

png("plot1.png", width=480, height=480)
hist(powerTwoDays$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",type="n")
dev.off()


