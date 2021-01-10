---
title: "Human Activity Recognition Using Smartphones Dataset"
output: html_document
keep_md: yes
---


## Project Description
This project focuses on preprocessing the Human Activity Recognition dataset, built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## Study design and data processing

### Collection of the raw data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured acceleration and angular velocity at a constant rate of 50Hz.<br /> 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap.<br /> 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. <br />The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.<br />
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. <br />


## Creating the tidy datafile

### Guide to create the tidy data file
The following set of operations cleans the raw data in tidy format.This data includes only the average of the measurements on the mean and standard deviation for each measurement. The averages are calculated for each activity and each subject.

- Merge the training and the test sets to create one data set.
- Extract the measurements on the mean and standard deviation for each measurement. 
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names. 
- Create an independent tidy data set with the average of each variable for each activity and each subject.

### Cleaning of the data
The script processes the raw data and extracts the averages of all the measurements on mean and standard deviation for each subject and activity. The names of each features are renamed to be more descriptive.

## Description of the variables in the tidy data

### Variables present in the dataset

1. subjects: The group of 30 volunteers who carried out the experiment.
- class: "integer"
- Allowable Values:
1-30 (1 means subject-1, 2 is subject-2 etc.)

2. activities: The six activities that each person performed.
- class:"factor"
- Allowable values:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS,
  - SITTING
  - STANDING
  - LAYING

3. Measured Values: The following features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. <br />The Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). <br />
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The mean and standard deviation(std) were estimated from these signals. <br />

class: "numeric"

	- tbodyacc_mean_x          
	- tbodyacc_mean_y           
	- tbodyacc_std_y            
	- tgravityacc_mean_y        
	- tgravityacc_std_y         
	- tbodyaccjerk_mean_y       
	- tbodyaccjerk_std_y        
	- tbodygyro_mean_y          
	- tbodygyro_std_y           
	- tbodygyrojerk_mean_y      
	- tbodygyrojerk_std_y       
	- tbodyaccmag_std           
	- tbodyaccjerkmag_mean      
	- tbodygyromag_std          
	- fbodyacc_mean_x           
	- fbodyacc_std_x            
	- fbodyaccjerk_mean_x       
	- fbodyaccjerk_std_x        
	- fbodygyro_mean_x          
	- fbodygyro_std_x           
	- fbodyaccmag_mean          
	- fbodybodyaccjerkmag_std   
	- fbodybodygyrojerkmag_mean 
	- tbodyacc_mean_z           
	- tbodyacc_std_z            
	- tgravityacc_mean_z        
	- tgravityacc_std_z         
	- tbodyaccjerk_mean_z       
	- tbodyaccjerk_std_z        
	- tbodygyro_mean_z          
	- tbodygyro_std_z           
	- tbodygyrojerk_mean_z      
	- tbodygyrojerk_std_z       
	- tgravityaccmag_mean       
	- tbodyaccjerkmag_std       
	- tbodygyrojerkmag_mean     
	- fbodyacc_mean_y           
	- fbodyacc_std_y            
	- fbodyaccjerk_mean_y       
	- fbodyaccjerk_std_y        
	- fbodygyro_mean_y          
	- fbodygyro_std_y           
	- fbodyaccmag_std           
	- fbodybodygyromag_mean     
	- fbodybodygyrojerkmag_std 
	- tbodyacc_std_x           
	- tgravityacc_mean_x       
	- tgravityacc_std_x        
	- tbodyaccjerk_mean_x      
	- tbodyaccjerk_std_x       
	- tbodygyro_mean_x         
	- tbodygyro_std_x          
	- tbodygyrojerk_mean_x     
	- tbodygyrojerk_std_x      
	- tbodyaccmag_mean         
	- tgravityaccmag_std       
	- tbodygyromag_mean        
	- tbodygyrojerkmag_std     
	- fbodyacc_mean_z          
	- fbodyacc_std_z           
	- fbodyaccjerk_mean_z      
	- fbodyaccjerk_std_z       
	- fbodygyro_mean_z         
	- fbodygyro_std_z          
	- fbodybodyaccjerkmag_mean 
	- fbodybodygyromag_std     

 <b><u>Notes:</u></b> <br /> 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.


### Source: 
<b>[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)</b>
