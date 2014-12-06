setwd("C:/datasci_r2")
## graph plotting assignment1, part2
##check file is in working directory
##read in file

data1<- read.csv( "household_power_consumption.txt" ,header = TRUE,sep = ";", stringsAsFactors= F, na.string="?")

## change data format

data1$Date3 <- strptime(data1$Date, "%d/%m/%Y")

##subset to required dates
data4 <- subset(data1, Date3 == "2007/02/01"|Date3=="2007/02/02")


##create new fields

data4$day<-  weekdays(data4$Date3)
data4$recno<- c(1:2880)
data4$Global_KW<- as.numeric(data4$Global_active_power) 

##draw graph to screen
with(data4,plot(data4$recno, data4$Global_KW, type="n",xaxt= "n",ylab="Global Active Power (kilowatts)", xlab=""))
lines(data4$recno,as.numeric(data4$Global_KW),col="black")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


##save a png
png(file="graph2.png")
##graph code 
with(data4,plot(data4$recno, data4$Global_KW, type="n",xaxt= "n",ylab="Global Active Power (kilowatts)", xlab=""))
lines(data4$recno,as.numeric(data4$Global_KW),col="black")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
dev.off()
