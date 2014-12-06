##setwd("C:/datasci_r2")
## graph plotting assignment1
##check file is in working directory
##read in file

data1<- read.csv( "household_power_consumption.txt" ,header = TRUE,sep = ";", stringsAsFactors= F, na.string="?")

## change data format

data1$Date3 <- strptime(data1$Date, "%d/%m/%Y")

##subset to required dates
data4 <- subset(data1, Date3 == "2007/02/01"|Date3=="2007/02/02")
data4$Global_KW<- as.numeric(data4$Global_active_power) 
##draw histogram on screen
hist((as.numeric(data4$Global_KW)), col="red", main="Global Active Power", xlab= "Global Active power (kilowatts)")

##save a png
 png(file="plot1.png")
 hist((as.numeric(data4$Global_KW)), col="red", main="Global Active Power", xlab= "Global Active power (kilowatts)")
dev.off()
