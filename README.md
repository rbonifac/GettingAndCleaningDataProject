## Assignment: Getting and Cleaning Data Course Project

### Project Description:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#### You should create one R script called run_analysis.R that does the following. 

- 1.Merges the training and the test sets to create one data set.
- 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
- 3.Uses descriptive activity names to name the activities in the data set
- 4.Appropriately labels the data set with descriptive variable names. 
- 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Files listed on this project:
- README.md - this file
- Codebook.md - Contains description of the steps and variables used in the project
- run_analysis.R - R script to merge the datasets and additional data cleaning based on 5 questions above.

### How to generate the tidy data set:

- a.From Github download the files for the [GettingAndCleaningDataProject] (https://github.com/rbonifac/GettingAndCleaningDataProject)
- b.Download raw data from source web link for [Raw Data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- c.Extract compressed file into the "UCI HAR Dataset" folder.
- d.Place the run_analysis.R script on the parent folder of the "UCI HAR Dataset" folder.
- e.Double click on the run_analysis.R file and will automatically opens in the R console. Type source('run_analysis.R') to execute the script.
- f.The file mean_std_groupby_subject_activity.txt with new tidy data set is created on the parent folder of "UCI HAR Dataset" folder.
- g.The run_analysis.R script provides an output which lists the datasets and files created during this process. Output is included in codebook document.
