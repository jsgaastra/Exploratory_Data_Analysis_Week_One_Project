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

#make Plot 2
dev.copy(png,'Plot2.png',width=480, height=480)
plot(DateTime,active,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.off()

