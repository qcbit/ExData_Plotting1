library(lubridate)
data<-read.table("household_power_consumption.txt", na.strings = "?", header=TRUE, sep=";")
data2<-within(data, Datetime<-as.POSIXct(paste(Date, Time), format="%d/%m/%Y %T"))
data3<-subset(data2, year(Datetime) == 2007 & month(Datetime) == 2 & day(Datetime) >= 1 & day(Datetime) <= 2)
#first plot is a histogram
hist(data3$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file = "plot1.png")
dev.off()