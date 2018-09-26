library(data.table)
library(png)

#read in data from txt file
power<-read.delim("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=F)
names(power)
head(power)

#reformat dates for subsetting
power$Date<-as.Date(power$Date, format="%d/%m/%Y") 
head(power)

#subset dataset to include only day for analysis
DayOne<-subset(power,power$Date>=as.Date("2007-02-01") & power$Date<=as.Date("2007-02-02"))
head(DayOne)

#creat variable names for graphs

DateTime <- strptime(paste(DayOne$Date, DayOne$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
active<-DayOne$Global_active_power
Sub_metering_1<-DayOne$Sub_metering_1
Sub_metering_2<-DayOne$Sub_metering_2
Sub_metering_3<-DayOne$Sub_metering_3
voltage<-DayOne$Voltage
reactive<-DayOne$Global_reactive_power

#make Plot 4
dev.copy(png,'Plot4.png',width=480, height=480)
par(mfrow=c(2,2))
plot(DateTime,active,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
plot(DateTime,voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(DateTime,Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(DateTime,Sub_metering_2,type="l", col= "red")
lines(DateTime,Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,lty= 1, lwd=2, col = c("black", "red", "blue"))
plot(DateTime,reactive,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
