library(lubridate)
d1<-read.table("household_power_consumption.txt", na.strings = "?", header=TRUE, sep=";")
d2<-within(d1, Datetime<-as.POSIXct(paste(Date, Time), format="%d/%m/%Y %T"))
d3<-subset(d2, year(Datetime) == 2007 & month(Datetime) == 2 & day(Datetime) >= 1 & day(Datetime) <= 2)

par(mfcol=c(2,2))

#plot 1
plot(x=d3$Datetime, y=d3$Global_active_power, type = "l", lab=c(3,5,7), xlab="", ylab="Global Active Power (kilowatts)")

#plot 2
plot(x=d3$Datetime, y=d3$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(x=d3$Datetime, y=d3$Sub_metering_2, col="Red")
lines(x=d3$Datetime, y=d3$Sub_metering_3, col="Blue")
legend("topright", lty=1, col = c("Black","Red","Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot 3
plot(x=d3$Datetime, y=d3$Voltage, type = "l", xlab="datetime", ylab="Voltage")

#plot 4
plot(x=d3$Datetime, y=d3$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()