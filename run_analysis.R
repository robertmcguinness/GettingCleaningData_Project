## download the data

## set the working directory
setwd("C:/Users/Rob_Loren/Documents/rob stuff/Data Analytics/Course 3 - Getting and Cleaning Data/Project")

## read the data
testData <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
testDataLabels <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
subjectTest <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
trainData <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
trainDataLabels <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
activityLabels <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./Working/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

## join the test subject and test labels to the test data
mergedTestData <- cbind(subjectTest, testDataLabels, testData)

## join the training subject and training labels to the training data
mergedTrainData <- cbind(subjectTrain, trainDataLabels, trainData)

## merge the training and test data
mergedData <- rbind(mergedTestData, mergedTrainData)

## change column names
colnames(mergedData) <- c("subject", "activity", as.character(features$V2))

## subset the dataframe for measurements on mean and standard deviation
subVariables <- c("subject", "activity", grep( "mean\\(\\)|std\\(\\))", names(mergedData), value = TRUE))
selectData <- subset(mergedData, select = subVariables)

## change data type for subject and activity to factor and label activity factor
selectData$activity <- factor(selectData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
selectData$subject <- factor(selectData$subject)



