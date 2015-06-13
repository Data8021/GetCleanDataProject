# Code Book for Getting and Cleaning Data Course Project

## Project Description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data associated with wearable computing. The goal is to create a tidy data set of subjects, activities and averages of various mean and standard deviation measurements.
 
##Study design and data processing
 
###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
 
The raw data was downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Addtional information on the raw data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Creating the tidy datafile
 
###Guide to create the tidy data file
1.  Reads in raw test and training data, integrates subject and activities data, and combines into a single data frame.
2.  Adds in correct activity labels and variable names.  
3.  Identifies the mean and standard deviation variables, creates new dataframe with those variables, and melts into a tidy dataset.  
4.  Groups data frame by subjects, activity, and measurement, and then finds the average of every combination.  Writes the output of the tidy dataset into "tidyData.txt". 

Additional details can be found in the following README.md here: https://github.com/Data8021/GetCleanDataProject/blob/master/README.md
 
##Description of the variables in the tinyData.txt file
The tidy dataset has 11,880 rows and 4 columns.  The four variables are:
*   ```subjects``` (integer)
*   ```activity``` (factor with 6 levels)
*   ```measurement``` (factor with 66 levels)
*   ```average``` (numeric)
 
###Variable 1 -- subjects
The subjects variable is an integer with values between 1-30 corresponding to each of the subjects of the experiment.

###Variable 2 -- activity
The activity variable is a factor with 6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. These correspond to each of the position of the subject when measurements were taken.

###Variable 3 -- measurement
The measurement variable is a factor with 66 levels. These measurements come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

A mean and stand deviation was identified for each measurement and for each axis, where noted.

###Variable 4 -- average
The average variable is numeric and captures the mean of measurements for each combination of subject-activity-measurement.