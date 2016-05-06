## Codebook for the Getting and Cleanning Data Project Course

## Raw Data collection background
==================================================================
 Human Activity Recognition Using Smartphones Dataset
 Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its 
embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows 
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the 
time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Feature Selection 
=================================================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a 
corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
Additional info is included in the info files provided in the compressed file.
=========================================================================================================================

## Creating a new Tidy Data Set
===================================

The following steps were executed by the run_analysis.R script:
 a.The activity and features labels files were loaded into R data tables. Descriptive names were given to the variable names to avoid any confusion.
 b.The test data files for measurements, activity and subject were loaded into separate r tables 
 c.The variable names were updated based on provided features labels.
 d.The same steps(b,c) were performed for the training files and merged into the trainData dataset.
 e.The merged test and train data tables were subsequently merged into the mergedData data table. This is the first dataset created.
 f.The variables for mean and standard deviation were extracted from the mergedData and placed into the meanStdData dataset.
 g.Activity labels were merged with the meanStdData to provide better understanding of the activities performed. 
 h.Variable names were enhanced to replace abbreviation and special characters.
 i.New tidy dataset was created with the average was calculated for the meassurement variables by subject and activity. See variable description below.
 k.New dataset groupedMeanStdData was saved into the file mean_std_groupby_subject_activity.txt.
- Note the train/test files under respective "Inertial Signals" folder were not in the scope of this excersice.

## Here is the output of the run_analysis.R script which provides the names of data tables and files:

	[1] "1.mergedData is the dataset with merged data from train and test data files"
	[1] "2.meanStdData is a subset of the mergedData set with the mean/std variables only"
	[1] "3.descriptive activity labels applied to activity data in meanStdData"
	[1] "4.descriptive variable labels applied to meanStdData"
	[1] "5.groupedMeanStdData is the tidy dataset created for a separate data with a summary of avg values per subject and activity"
	[1] " The file mean_std_groupby_subject_activity.txt was created which contains new tidy data set"

## Description for updated variables in the tidy dataset 

These variables have the same description provided in the raw data. They have been enhanced to provide easier readability:

subject is the individual who used the device. Activity is the activity description performed by the subject.
 [1] "subject" -values 1 to 30.                                                
 [2] "activity" - values WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING                                               
--Time Domain measurement variables: the value represents average of mean and std of each variable
 [3] "TimeBodyAccelerometer-Mean-X"                             
 [4] "TimeBodyAccelerometer-Mean-Y"                             
 [5] "TimeBodyAccelerometer-Mean-Z"                             
 [6] "TimeBodyAccelerometer-StandardDeviation-X"                
 [7] "TimeBodyAccelerometer-StandardDeviation-Y"                
 [8] "TimeBodyAccelerometer-StandardDeviation-Z"                
 [9] "TimeGravityAccelerometer-Mean-X"                          
[10] "TimeGravityAccelerometer-Mean-Y"                          
[11] "TimeGravityAccelerometer-Mean-Z"                          
[12] "TimeGravityAccelerometer-StandardDeviation-X"             
[13] "TimeGravityAccelerometer-StandardDeviation-Y"             
[14] "TimeGravityAccelerometer-StandardDeviation-Z"             
[15] "TimeBodyAccelerometerJerk-Mean-X"                         
[16] "TimeBodyAccelerometerJerk-Mean-Y"                         
[17] "TimeBodyAccelerometerJerk-Mean-Z"                         
[18] "TimeBodyAccelerometerJerk-StandardDeviation-X"            
[19] "TimeBodyAccelerometerJerk-StandardDeviation-Y"            
[20] "TimeBodyAccelerometerJerk-StandardDeviation-Z"            
[21] "TimeBodyGyrometer-Mean-X"                                 
[22] "TimeBodyGyrometer-Mean-Y"                                 
[23] "TimeBodyGyrometer-Mean-Z"                                 
[24] "TimeBodyGyrometer-StandardDeviation-X"                    
[25] "TimeBodyGyrometer-StandardDeviation-Y"                    
[26] "TimeBodyGyrometer-StandardDeviation-Z"                    
[27] "TimeBodyGyrometerJerk-Mean-X"                             
[28] "TimeBodyGyrometerJerk-Mean-Y"                             
[29] "TimeBodyGyrometerJerk-Mean-Z"                             
[30] "TimeBodyGyrometerJerk-StandardDeviation-X"                
[31] "TimeBodyGyrometerJerk-StandardDeviation-Y"                
[32] "TimeBodyGyrometerJerk-StandardDeviation-Z"                
[33] "TimeBodyAccelerometerMagnitude-Mean"                      
[34] "TimeBodyAccelerometerMagnitude-StandardDeviation"         
[35] "TimeGravityAccelerometerMagnitude-Mean"                   
[36] "TimeGravityAccelerometerMagnitude-StandardDeviation"      
[37] "TimeBodyAccelerometerJerkMagnitude-Mean"                  
[38] "TimeBodyAccelerometerJerkMagnitude-StandardDeviation"     
[39] "TimeBodyGyrometerMagnitude-Mean"                          
[40] "TimeBodyGyrometerMagnitude-StandardDeviation"             
[41] "TimeBodyGyrometerJerkMagnitude-Mean"                      
[42] "TimeBodyGyrometerJerkMagnitude-StandardDeviation" 

-Frequency Domain measurement variables. The value represents average of mean and std of each variable       
[43] "FrequencyBodyAccelerometer-Mean-X"                        
[44] "FrequencyBodyAccelerometer-Mean-Y"                        
[45] "FrequencyBodyAccelerometer-Mean-Z"                        
[46] "FrequencyBodyAccelerometer-StandardDeviation-X"           
[47] "FrequencyBodyAccelerometer-StandardDeviation-Y"           
[48] "FrequencyBodyAccelerometer-StandardDeviation-Z"           
[49] "FrequencyBodyAccelerometer-MeanFrequency-X"               
[50] "FrequencyBodyAccelerometer-MeanFrequency-Y"               
[51] "FrequencyBodyAccelerometer-MeanFrequency-Z"               
[52] "FrequencyBodyAccelerometerJerk-Mean-X"                    
[53] "FrequencyBodyAccelerometerJerk-Mean-Y"                    
[54] "FrequencyBodyAccelerometerJerk-Mean-Z"                    
[55] "FrequencyBodyAccelerometerJerk-StandardDeviation-X"       
[56] "FrequencyBodyAccelerometerJerk-StandardDeviation-Y"       
[57] "FrequencyBodyAccelerometerJerk-StandardDeviation-Z"       
[58] "FrequencyBodyAccelerometerJerk-MeanFrequency-X"           
[59] "FrequencyBodyAccelerometerJerk-MeanFrequency-Y"           
[60] "FrequencyBodyAccelerometerJerk-MeanFrequency-Z"           
[61] "FrequencyBodyGyrometer-Mean-X"                            
[62] "FrequencyBodyGyrometer-Mean-Y"                            
[63] "FrequencyBodyGyrometer-Mean-Z"                            
[64] "FrequencyBodyGyrometer-StandardDeviation-X"               
[65] "FrequencyBodyGyrometer-StandardDeviation-Y"               
[66] "FrequencyBodyGyrometer-StandardDeviation-Z"               
[67] "FrequencyBodyGyrometer-MeanFrequency-X"                   
[68] "FrequencyBodyGyrometer-MeanFrequency-Y"                   
[69] "FrequencyBodyGyrometer-MeanFrequency-Z"                   
[70] "FrequencyBodyAccelerometerMagnitude-Mean"                 
[71] "FrequencyBodyAccelerometerMagnitude-StandardDeviation"    
[72] "FrequencyBodyAccelerometerMagnitude-MeanFrequency"        
[73] "FrequencyBodyAccelerometerJerkMagnitude-Mean"             
[74] "FrequencyBodyAccelerometerJerkMagnitude-StandardDeviation"
[75] "FrequencyBodyAccelerometerJerkMagnitude-MeanFrequency"    
[76] "FrequencyBodyGyrometerMagnitude-Mean"                     
[77] "FrequencyBodyGyrometerMagnitude-StandardDeviation"        
[78] "FrequencyBodyGyrometerMagnitude-MeanFrequency"            
[79] "FrequencyBodyGyrometerJerkMagnitude-Mean"                 
[80] "FrequencyBodyGyrometerJerkMagnitude-StandardDeviation"    
[81] "FrequencyBodyGyrometerJerkMagnitude-MeanFrequency" 

Good Luck!
