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

#creat variable names

DateTime <- strptime(paste(DayOne$Date, DayOne$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
active<-DayOne$Global_active_power

#make Plot 1
dev.copy(png,'Plot1.png',width=480, height=480)
hist(active,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

