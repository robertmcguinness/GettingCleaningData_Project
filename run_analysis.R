## download the data
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/biomech.zip")
unzip(zipfile="./data/biomech.zip",exdir="./data")

## read the data
testData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testDataLabels <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
trainData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainDataLabels <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

## join the test subject and test labels to the test data
mergedTestData <- cbind(subjectTest, testDataLabels, testData)

## join the training subject and training labels to the training data
mergedTrainData <- cbind(subjectTrain, trainDataLabels, trainData)

## merge the training and test data
mergedData <- rbind(mergedTestData, mergedTrainData)

## change column names
colnames(mergedData) <- c("subject", "activity", as.character(features$V2))

## subset the dataframe for measurements on mean and standard deviation
subVariables <- c("subject", "activity", grep( "mean\\(\\)|std\\(\\)", names(mergedData), value = TRUE))
selectData <- subset(mergedData, select = subVariables)

## change data type for subject and activity to factor and label activity factor
selectData$activity <- factor(selectData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
selectData$subject <- factor(selectData$subject)

library(dplyr)
selectDataTb <- tbl_df(selectData)

## rename variables
names(selectDataTb) <- gsub("^t", "time", names(selectDataTb))
names(selectDataTb) <- gsub("^f", "frequency", names(selectDataTb))
names(selectDataTb) <- gsub("Acc", "Acceleration", names(selectDataTb))
names(selectDataTb) <- gsub("Gyro", "Gyroscope", names(selectDataTb))
names(selectDataTb) <- gsub("Mag", "Magnitude", names(selectDataTb))
names(selectDataTb) <- gsub("BodyBody", "Body", names(selectDataTb))
names(selectDataTb) <- gsub("-", "", names(selectDataTb))
names(selectDataTb) <- gsub("std", "Std", names(selectDataTb))
names(selectDataTb) <- gsub("mean", "Mean", names(selectDataTb))
names(selectDataTb) <- gsub("\\(", "", names(selectDataTb))
names(selectDataTb) <- gsub("\\)", "", names(selectDataTb))

## group by subject and activity
subjectActivityMean <- group_by(selectDataTb, subject, activity)
meanSummary <- summarize_each(subjectActivityMean, funs(mean))

## write the tidy data set
write.table(meanSummary, file = "tidy.txt",row.name = FALSE)
