# Getting and Cleaning Data Course Project

This project takes raw training and test data collected by a smartphone's accelerometer and gyroscope during six different activities and transforms the data into a tidy data set of the means and standard deviations of a variety of measurements.

The run_analysis.R file should be run on the data found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code in run_analysis performs the following:  
1.  Reads in test data, along with subjects lists and activities lists, then adds the subjects and activities to the test data frame.  
2.  Reads in training data, along with subjects lists and activities lists, then adds the subjects and activities to the test data frame.  
3.  Combines the test and training data into a single data frame.  
4.  Adds in correct activity labels and variable names.  
5.  Identifies the mean and standard deviation variables, and creates new dataframe with those variables.  
6.  Melts into tidy dataset.  
7.  Groups data frame by subjects, activity, and measurement, and then finds the average of every combination.  
8.  Write the output of the tidy dataset into "tidyData.txt".  This file can be read into R with ```{r}read.table("tidyData.txt", header=TRUE)```