setwd("C:/datasci_r2")
## graph plotting assignment1, part3
## check file is in working directory
##read in file
data1<- read.csv( "household_power_consumption.txt" ,header = TRUE,sep = ";", stringsAsFactors= F, na.string="?")

## change data format

data1$Date3 <- strptime(data1$Date, "%d/%m/%Y")

##subset to required dates
data4 <- subset(data1, Date3 == "2007/02/01"|Date3=="2007/02/02")

##new fields

data4$day<-  weekdays(data4$Date3)
data4$recno<- c(1:2880)



##plot graph to screen
with (data4, plot(data4$recno,as.numeric(Sub_metering_1), type="n", ylab="Energy sub metering", xlab ="", xaxt= "n",yaxt="n") )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,30,10))
lines(data4$recno,as.numeric(data4$Sub_metering_1),col="black")
lines(data4$recno,as.numeric(data4$Sub_metering_2),col="red")
lines(data4$recno,as.numeric(data4$Sub_metering_3),col="blue")
legend("topright",lty=1, col = c("black", "red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))




##save a png
png(file="plot3.png")
##graph code
with (data4, plot(data4$recno,as.numeric(Sub_metering_1), type="n", ylab="Energy sub metering", xlab ="", xaxt= "n",yaxt="n") )
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2,at=seq(0,30,10))
lines(data4$recno,as.numeric(data4$Sub_metering_1),col="black")
lines(data4$recno,as.numeric(data4$Sub_metering_2),col="red")
lines(data4$recno,as.numeric(data4$Sub_metering_3),col="blue")
legend("topright",lty=1, col = c("black", "red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()
