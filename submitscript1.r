pollutantmean <- function(directory, pollutant, id = 1:332) {
     file_list <- list.files(directory, full.names = TRUE)
     dat <- data.frame()     #Here I learned, initialize your needed stuff outside the loop! 
     for (i in id) { 
         dat <- rbind(dat, read.csv(file_list[i])) 
     }
     mean(dat[ , pollutant], na.rm = TRUE)
     
}  
  
