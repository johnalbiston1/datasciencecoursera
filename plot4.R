setwd("C:/datasci_r2")
## graph plotting assignment1, part4
##check data file is in workig directory
##read in file

data1<- read.csv( "household_power_consumption.txt" ,header = TRUE,sep = ";", stringsAsFactors= F, na.string="?")

## change data format

data1$Date3 <- strptime(data1$Date, "%d/%m/%Y")

##subset to required dates
data4 <- subset(data1, Date3 == "2007/02/01"|Date3=="2007/02/02")


##new fileds
##data4$day<- wday(data4$Date3, label=TRUE)
data4$day<-  weekdays(data4$Date3)
data4$recno<- c(1:2880)

##part4
par(mfrow=c(2,2))
## part a
with (data4, plot(data4$recno, data4$Global_KW, type="l",ylab="Global Active Power ", xlab="", xaxt="n"))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
##part b
with (data4, plot(data4$recno, as.numeric(data4$Voltage), type="l",ylab="Voltage", xlab="datetime", xaxt="n"))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
##part c
with (data4, plot(data4$recno,as.numeric(Sub_metering_1), type="l", ylab="Energy sub metering", xlab ="", xaxt= "n") )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
##axis(2,at=seq(0,30,10))
lines(data4$recno,as.numeric(data4$Sub_metering_1),col="black")
lines(data4$recno,as.numeric(data4$Sub_metering_2),col="red")
lines(data4$recno,as.numeric(data4$Sub_metering_3),col="blue")
legend("topright",lty=1, cex= 0.6,col = c("black", "red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
##part d
with (data4, plot(data4$recno, data4$Global_reactive_power, type="l",ylab="Global_rective_power", xlab="datetime", xaxt="n"))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


##save a png
png(file="graph1.png")
##graph code 
par(mfrow=c(2,2))
## part a
with (data4, plot(data4$recno, data4$Global_KW, type="l",ylab="Global Active Power ", xlab="", xaxt="n"))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
##part b
with (data4, plot(data4$recno, as.numeric(data4$Voltage), type="l",ylab="Voltage", xlab="datetime", xaxt="n"))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
##part c
with (data4, plot(data4$recno,as.numeric(Sub_metering_1), type="l", ylab="Energy sub metering", xlab ="", xaxt= "n") )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
##axis(2,at=seq(0,30,10))
lines(data4$recno,as.numeric(data4$Sub_metering_1),col="black")
lines(data4$recno,as.numeric(data4$Sub_metering_2),col="red")
lines(data4$recno,as.numeric(data4$Sub_metering_3),col="blue")
legend("topright",lty=1, cex= 0.6,col = c("black", "red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
##part d
with (data4, plot(data4$recno, data4$Global_reactive_power, type="l",ylab="Global_rective_power", xlab="datetime", xaxt="n"))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

dev.off()
