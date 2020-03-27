---
title: "CodeBook.md"
output: html_document
---

# Data
The data used for this project was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# R Code

The code can be found in the "run_analysis.R" file, which analyses the data by following these steps:
1. Creates one data set by merging the training and the test sets.
2. Extracts the mean and standard deviation for each measurement.
3. Names the activities in the data set.
4. Labels the data set.
5. Creates a secondary independent tidy data set with the average of each variable for each activity and each subject.

# Explanation of Variables

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the data.
