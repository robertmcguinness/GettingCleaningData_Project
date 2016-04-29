## Summary

---

Human Activity Recognition Using Smartphones Dataset
Version 1.0

---

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

---

## Data collection overview

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Raw Data Summary

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The dataset includes the following files:

* `README.txt`
* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent:

* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis. 
* `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Transformations and adjustments for tidy data set using `run_analysis.R`

### Read the data
The following datasets are read: `X_test.txt`, `Y_test.txt`, `subject_test.txt`, `X_train.txt`, `Y_train.txt`, `subject_train.txt`, `activity_labels.txt`, and `features.txt`.

### Data is merged into one table
The `cbind` function is used to mefge the test data, test labels, and test subjects. This is also completed for the training data. Finally the `rbind` function is used  to brign the training and test data together. 

### Variable and colimn names are added
The subjects variable is labeled "subject", the activity is labeled "activity", and the `features` character is used for the remaining variables.

### subset the dataframe for measurements on mean and standard deviation
`grep` and regualr expressions are used to create a vector to subset the merged data based on only mean and standard deviation meaurements.

### change data type for subject and activity to factor and label activity factor
The subject and activity variables are converted to factor type and activity labels are used.

### rename variables
Variables are renamed using only characters and expanding on abbreviations.

## group by subject and activity and write the tidy data table 
The dplyr package is used to group the data and summarize. The `summarize_each` funtion creates a second, independent tidy data set with the average of each variable for each activity and each subject which is `tidy.txt`.
