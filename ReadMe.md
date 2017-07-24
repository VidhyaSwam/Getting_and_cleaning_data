Review criteria 
1.	The submitted data set is tidy.
2.	The Github repo contains the required scripts.
3.	GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4.	The README that explains the analysis files is clear and understandable.
5.	The work submitted for this project is the work of the student who submitted it.

Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
Source of the data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data of the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Creating the Dataset:
The R script run_analysis.R is used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps:
1)	Download and unzip source data if it doesn't exist.
2)	Read the data and store it in a variable.
3)	Merge the training and the test sets into one.
4)	Extract only the measurements on the mean and standard deviation for each measurement.
5)	Use descriptive activity names to name the activities in the data set.
6)	Appropriately label the data set with descriptive variable names.
7)	Create a second, independent tidy set with the average of each variable for each activity and each subject.
8)	Write the data set to the aggResult.txt file.
The aggResult.txt in th
is repository was created by running the run_analysis.R script using R version 3.4.0.
"# Getting_and_cleaning_data" 
