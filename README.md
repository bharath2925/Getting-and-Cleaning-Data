---
title: "README"
output: html_document
---
## Repository Contents
This repo has the following files:

### 1. run_analysis.R

This is the R script that is called to performed the cleaning and tidying of the dataset. This script is well annotated with comments explaining the process. The following steps are performend in this script using R Studio:

- Merge the training and the test sets to create one data set.
- Extract the measurements on the mean and standard deviation for each measurement. 
- Use descriptive activity names to name the activities in the data set.
- Appropriately label the data set with descriptive variable names. 
- Create an independent tidy data set with the average of each variable for each activity and each subject.
This file assumes that datazip file has been downloaded and unzipped from the below location.<br />
<br />
<b>[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)</b>

The following R Libraries are used to process the raw data.

- dplyr
- readr

### 2. CodeBook.rmd

This is a mark down document describing the variables, the data, and any transformations performed to clean up the data. This document also elaborates on how data was sourced and also providing detailed explanation of all the variables and summaries calculated in the script, along with units, and any other relevant information.
