corr <- function(directory, threshold = 0) {
  file_list <- list.files(directory, full.names = TRUE)
  cor_data <- vector()
  data1 <- data.frame()
  
  
  for (i in 1:332) {
      
      data1 <- read.csv(file_list[i])
      data2 <- data1[complete.cases(data1),]
      
      if(nrow(data2) > threshold)
        cor_data[i] <- cor(data2$nitrate,data2$sulfate)
  }
  print(cor_data)
   
}