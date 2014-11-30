complete <- function(directory, id = 1:332) {
  file_list <- list.files(directory, full.names = TRUE)
  data1 <- data.frame()
  nobs <- vector()
  for (i in id) {
    #dat <- na.omit(read.csv(file_list[i]))
    data1 <- read.csv(file_list[i])
    data2 <- data1[complete.cases(data1),]
    nobs <- rbind(nobs,data.frame('id'=i,'nobs'=nrow(dat)))
  }
  nobs

}