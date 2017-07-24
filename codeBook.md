Code Book for Getting and Cleaning Data Course Project:

Overview
Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Full Description at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Process:
The script run_analysis.R was developed by performing the following steps:

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement.
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names.
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables:

X_test - table contents of test/X_test.txt

X_train - table contents of train/X_train.txt

Y_test - table contents of test/Y_test.txt

Y_train - table contents of train/Y_train.txt

consolFile - Measurement data. Combined data set of the two above variables

subject_test - table contents of test/subject_test.txt

subject_train- table contents of test/subject_train.txt

XC_train – Merge file for X_train, Y_train and Subject Train

XC_test   –  Merge file for X_train, Y_train and Subject Train

Cname – column names for the consolidated files

Features – Have contents of features.txt

selectRows_w_ActyNm --  Merge file containing records from selectRows dataframe with Activity description

aggResult – aggregate results of dataframe

selectCols – Contains the Grep of Mean, activity, Subject and standard

selectRows – – mean, sd, activity, subjected  columns from master consol file.




Output

aggResult.txt

Details of the output file

aggResult.txt  contains 180 rows and 89 columns.

The first column contains Activityno..
The second column contains activity names.
The third column contains subjectID.
The last 86 columns are measurements.

