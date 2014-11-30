
 readme

file to outline the steps in the assignment on tidy data

Load in the files required for assignment
features.txt
activity_labels.txt
 

X_train.txt
y_train.txt
subject_train.txt


X_test.txt
y_test.txt
subject_test.txt

the 2 data sets, train and test  are in three parts x, y, subject

join these 2 dat asets together by adding the extra columns on the end using cbind


Once you have the two dat sets

add these to gether using the rbind commands which adds one data set to the bottom of the other

Using the features table get the column names and add them to the new table

Find all the column names and make a sunset of those containing either the mean or standard deviation values
Then use lapply to calculatethe mean and standard deviations of those columns

tidy th edataset up to create a long thin table using the melt syntax

write the results to a table
