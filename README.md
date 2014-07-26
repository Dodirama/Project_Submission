==================================================================
Human Activity Recognition Using Smartphones Dataset
Tidy Data Set
==================================================================
Original Data From
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
## Background (From original README.txt file) [1]
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.

The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md': Shows information about the variables.

- 'run_analysis.R': Code that can be used on original data to produce tidy data.

- 'agg_data.txt': The tidy data set of means of means and standard deviation for
each subject performing each activity. 

The run_analysis.R file performs the following tasks:
=====================================================
(please open the file for more detailed comments on the code)

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set.
4) Appropriately labels the data set with descriptive variable names, by using 
the text in features.txt while removing illegal characters such as - and () and 
the repeated use of "Body". 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
