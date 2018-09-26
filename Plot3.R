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
Sub_metering_1<-DayOne$Sub_metering_1
Sub_metering_2<-DayOne$Sub_metering_2
Sub_metering_3<-DayOne$Sub_metering_3


#make Plot 3
dev.copy(png,'Plot3b.png',width=480, height=480)
plot(DateTime,Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(DateTime,Sub_metering_2,type="l", col= "red")
lines(DateTime,Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()

