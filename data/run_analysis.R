


features1<- read.csv("features.txt",header = FALSE,sep = "")
activity<- read.csv("activity_labels.txt",header = FALSE,sep = "")
 

train1<- read.csv("X_train.txt",header = FALSE,sep = "")
train2<- read.csv("y_train.txt",header = FALSE,sep = "")
trainsub<-read.csv("subject_train.txt",header = FALSE,sep = "")
trainfull<-cbind(train1,train2,trainsub)

test1<- read.csv("X_test.txt",header = FALSE,sep = "")
test2<- read.csv("y_test.txt",header = FALSE,sep = "")
testsub<-read.csv("subject_test.txt",header = FALSE,sep = "")
testfull<-cbind(test1,test2,testsub)


alldata<-rbind(testfull,trainfull)


 
cnames<- make.names(features1$V2)
cnames<-c(cnames,"activty","subject")
names(alldata)<- cnames


std<- grep("std",cnames)
mean5<-  grep("mean\\(\\)",features1$V2)

reqcols<- c(std,mean5,562,563)


finaldata1<- alldata[,(reqcols)]


finaldata1[67][finaldata1[67] == 1] <- "WALKING"
finaldata1[67][finaldata1[67] == 2] <- "WALKING_UPSTAIRS"
finaldata1[67][finaldata1[67] == 3] <- "WALKING_DOWNSTAIRS"
finaldata1[67][finaldata1[67] == 4] <- "SITTING"
finaldata1[67][finaldata1[67] == 5] <- "STANDING"
finaldata1[67][finaldata1[67] == 6] <- "LAYING"

library (data.table)
finaldata1_DT <- data.table(finaldata1) 

qwert<-finaldata1_DT[, lapply(.SD,mean), by = c("activty","subject")]

qwert2<-finaldata1_DT[, lapply(.SD,mean), by = c("subject","activty")]

qwert3 <- melt(finaldata1_DT, id.vars = c("subject","activty"))
write.csv(qwert3, file="output3")



