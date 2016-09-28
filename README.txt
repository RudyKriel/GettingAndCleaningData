================================================================================
Human Activity Recognition Using Smartphones Dataset Summary for Course Project
Version 1.0
================================================================================

Purpose of this repo
=======================================
The purpose of this repo is to provide a tidy dataset based on the data provided which summates the data for each Activity and Subject giving the mean (average) value of each original measure relating to Mean or Standard Deviation measures in the original dataset.


=======================================
Source data
=======================================
This assignment is based on the data provided at the following location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Acknowledging the work done by: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For more information reference the README.txt contained in the refereced zip folder above.

=======================================
An excerpt from the original README.txt reads as follows to provide some context:
=======================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

=======================================
This repo includes the following files:
=======================================
1. 'README.txt' - provides information about the contents of the repo
2. 'CodeBook.md' - provides a description of the run_analysis.R file and the process followed
3. 'run_analysis.R' - the R script to read, manipulate and create the tidy data set in TidyDataSummary.csv
4. 'TidyDataSummary.csv' - the resultant tidy data set as an output file


