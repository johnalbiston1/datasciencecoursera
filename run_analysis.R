##open required libraries
library(reshape2)
library (data.table)

##read in files
features1<- read.csv("features.txt",header = FALSE,sep = "")
activity<- read.csv("activity_labels.txt",header = FALSE,sep = "")
 

train1<- read.csv("X_train.txt",header = FALSE,sep = "")
train2<- read.csv("y_train.txt",header = FALSE,sep = "")
trainsub<-read.csv("subject_train.txt",header = FALSE,sep = "")
##create dataset 1
trainfull<-cbind(train1,train2,trainsub)

test1<- read.csv("X_test.txt",header = FALSE,sep = "")
test2<- read.csv("y_test.txt",header = FALSE,sep = "")
testsub<-read.csv("subject_test.txt",header = FALSE,sep = "")
##create dataset 1
testfull<-cbind(test1,test2,testsub)

## add two data sets together
alldata<-rbind(testfull,trainfull)


 ## get data column names
cnames<- make.names(features1$V2)
cnames<-c(cnames,"activty","subject")
names(alldata)<- cnames

##find columns required which contain mean or std
std<- grep("std",cnames)
mean5<-  grep("mean\\(\\)",features1$V2)
##selected columns required
reqcols<- c(std,mean5,562,563)


finaldata1<- alldata[,(reqcols)]

##decode activities
finaldata1[67][finaldata1[67] == 1] <- "WALKING"
finaldata1[67][finaldata1[67] == 2] <- "WALKING_UPSTAIRS"
finaldata1[67][finaldata1[67] == 3] <- "WALKING_DOWNSTAIRS"
finaldata1[67][finaldata1[67] == 4] <- "SITTING"
finaldata1[67][finaldata1[67] == 5] <- "STANDING"
finaldata1[67][finaldata1[67] == 6] <- "LAYING"


finaldata1_DT <- data.table(finaldata1) 
## get mean and stedv of coulns by activity and subject
qwert<-finaldata1_DT[, lapply(.SD,mean), by = c("activty","subject")]


qwert2<-finaldata1_DT[, lapply(.SD,mean), by = c("subject","activty")]

## order table
##qwert2a<- qwert2[order(qwert2[1]),]


## create tidy long dataset
##qwert3 <- melt(finaldata1_DT, id.vars = c("subject","activty"))
##write data out
write.csv(qwert2, file="tidydata2.txt")