# Getting and Cleaning Data Project

This repo is a submission for the "Getting and Cleaning Data" course project.

## Overview

The goal is to prepare tidy data that can be used for later analysis. The raw data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The raw data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The objective is to:  

  1. Merge the training and the test sets to create one data set.  
  2. Extract only the measurements on the mean and standard deviation for each measurement.  
  3. Use descriptive activity names to name the activities in the data set.  
  4. Appropriately label the data set with descriptive variable names.  
  5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.  

## Files in Repo

`run_analysis.R` contains the R scripts that accomplish the objectives.  
`tidy.txt` is the independent tidy data set ffrom the analysis.  
`CODEBOOK.md` contains information on the data, variables and work completed to clean the data.  
