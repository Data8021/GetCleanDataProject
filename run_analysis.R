library(dplyr)
library(reshape2)

## Read in test data, subject list and activity list
xtest <- read.table("data/test/X_test.txt", header = FALSE, sep = "")
xtestSubjects <- read.table("data/test/subject_test.txt")
xtestActivity <- read.table("data/test/y_test.txt")

## Add subjects and activity to test dataset
xtest <- cbind(xtest, xtestSubjects, xtestActivity)

## Read in training data, subject list and activity list
xtrain <- read.table("data/train/X_train.txt", header = FALSE, sep = "")
xtrainSubjects <- read.table("data/train/subject_train.txt")
xtrainActivity <- read.table("data/train/y_train.txt")

## Add subjects and activity to test dataset
xtrain <- cbind(xtrain, xtrainSubjects, xtrainActivity)

## Remove non-relevant variables and dataframes
rm(xtestActivity, xtestSubjects, xtrainActivity, xtrainSubjects)

## Bind the training and testing datasets
fullData <- rbind(xtest, xtrain)
rm(xtest, xtrain)

## Remove duplicate column names
colnames(fullData) <- c(seq(1:562), "activitynum")

## Merge in activity lebels
activityList <- read.table("data/activity_labels.txt", sep=" ")
colnames(activityList) <- c("activitynum", "activity")
fullData <- left_join(fullData, activityList, by="activitynum")
fullData <- tbl_df(fullData) %>%
    select(-activitynum)
rm(activityList)

## Read in variable names and apply to columns
featureList <- read.table("data/features.txt", sep = " ", stringsAsFactor = FALSE)
featureList <- featureList[, 2]
featureList[562] <- "subjects"
featureList[563] <- "activity"
colnames(fullData) <- featureList

## Identify mean and standard deviation variables (except those
## without a standard deviation), and create new dataframe with 
## those variables
varMeanStd <- intersect(grep("mean|std",featureList),
                        grep("Freq",featureList,invert=TRUE))
tidyData <- fullData[, c(varMeanStd, 562, 563)]
rm(varMeanStd, featureList, fullData)

## Melt into tidy dataset and rename varibale 
tidyData <- melt(tidyData, id.vars = c("subjects", "activity"))
tidyData <- rename(tidyData, measurement = variable)

## Group by subjects, activity, and measurement, and
## then find the average of every combination
tidyData <- tbl_df(tidyData) %>%
    group_by(subjects, activity, measurement) %>%
    summarise(average=mean(value))

## Write TXT file
write.table(tidyData, file="tidyData.txt", row.name=FALSE)