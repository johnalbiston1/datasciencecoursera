> corr <- function(directory, threshold = 0) { 
+     file_list <- list.files(directory, full.names = TRUE)
+     cor_data <- vector()
+     for (i in 1:332) {
+         data <- read.csv(file_list[i])
+         clean_data <- na.omit(data)
+         if(nrow(clean_data) > threshold)
+             cor_data[i] <- cor(clean_data$nitrate,clean_data$sulfate) 
+     }
+     print(cor_data)
+ }
