## run_analisys.R script to process wearable computing data collected from samsung smartphones
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
library(dplyr)

# Read main data labels
old_dir<-getwd()
setwd("./UCI HAR Dataset")
list.files()
#[1] "activity_labels.txt" "features.txt"        "features_info.txt"   "README.txt"         
#[5] "test"                "train" 

activityLabel<-read.table("./activity_labels.txt")
#str(activityLabel) #'data.frame':	6 obs. of  2 variables:

featureLabel<-read.table("./features.txt")
#str(featureLabel) #'data.frame':	561 obs. of  2 variables:

#rename columns
activityLabel<- rename(activityLabel,id=V1, activityDescrip=V2)  
featureLabel<- rename(featureLabel,id=V1, featureDescrip=V2)

#Read Test Data
list.files(path="./test")
testFeatureData<- read.table("./test/X_test.txt",colClasses=numeric())
#str(testFeatureData) #'data.frame':	2947 obs. of  561 variables:
testActivityData<- read.table("./test/y_test.txt",colClasses=numeric())
#str(testActivityData) #'data.frame':	2947 obs. of  1 variable:
testSubjectData<- read.table("./test/subject_test.txt",colClasses=numeric())
#str(testSubjectData) #'data.frame':	2947 obs. of  1 variable:

#rename values and columns
names(testFeatureData)<- featureLabel$featureDescrip
testActivityData<- rename(testActivityData,activityID=V1)
testSubjectData<- rename(testSubjectData,subjectID=V1)

#combine test data
#note dataSet variable is optional, used to denote where the data came from
testData<-cbind(testFeatureData, testActivityData,testSubjectData,dataSet="test")

#Read Training Data
list.files(path="./train")
#[1] "Inertial Signals"  "subject_train.txt" "X_train.txt"       "y_train.txt"
trainFeatureData<- read.table("./train/X_train.txt",colClasses=numeric())
#str(trainFeatureData) # 'data.frame':	7352 obs. of  561 variables:
trainActivityData<- read.table("./train/y_train.txt",colClasses=numeric())
#str(trainActivityData) #'data.frame':	7352 obs. of  1 variable:
trainSubjectData<- read.table("./train/subject_train.txt",colClasses=numeric())
#str(trainSubjectData) #'data.frame':	7352 obs. of  1 variable:

#rename values and columns
names(trainFeatureData)<- featureLabel$featureDescrip
trainActivityData<- rename(trainActivityData,activityID=V1)
trainSubjectData<- rename(trainSubjectData,subjectID=V1)

#combine training data
#note dataSet variable is optional, used to denote where the data came from
trainData<-cbind(trainFeatureData, trainActivityData,trainSubjectData,dataSet="training")
#str(trainData) #'data.frame':	7352 obs. of  564 variables:
########################

#merging the two data sets
mergedData<- rbind(testData,trainData)
#str(mergedData)
print("1.mergedData is the dataset with merged data from train and test data files")

# Q2 extract mean and std variables from merged dataset 
subsetNames<-grepl("mean|std|activityID|subjectID",names(mergedData))
meanStdData <- mergedData[,subsetNames]
print("2.meanStdData is a subset of the mergedData set with the mean/std variables only")

# Q3 merged activity labels
meanStdData<- merge(meanStdData,activityLabel,by.x="activityID",by.y="id")

#remove activityID
meanStdData <- select(meanStdData,-activityID)
print("3.descriptive activity labels applied to activity data in meanStdData")

# Q4 replace abreviation and special characters
names(meanStdData) <- gsub('Freq',"Frequency",names(meanStdData))
names(meanStdData) <- gsub('^t',"Time",names(meanStdData))
names(meanStdData) <- gsub('^f',"Frequency",names(meanStdData))
names(meanStdData) <- gsub('Acc',"Accelerometer",names(meanStdData))
names(meanStdData) <- gsub('Gyro',"Gyrometer",names(meanStdData))
names(meanStdData) <- gsub('Mag',"Magnitude",names(meanStdData))
names(meanStdData) <- gsub('mean',"Mean",names(meanStdData))
names(meanStdData) <- gsub('std',"StandardDeviation",names(meanStdData))
names(meanStdData) <- gsub('BodyBody',"Body",names(meanStdData))
names(meanStdData) <- gsub('\\(\\)',"",names(meanStdData))
names(meanStdData) <- gsub('activityDescrip',"activity",names(meanStdData))
names(meanStdData) <- gsub('subjectID',"subject",names(meanStdData))
print("4.descriptive variable labels applied to meanStdData")

# Q5 calculates average of feature variables by subject and activity
groupedMeanStdData = ddply(meanStdData, c("subject","activity"), numcolwise(mean))
# creates a new file with new tidy dataset
write.table(groupedMeanStdData, file = "./mean_std_groupby_subject_activity.txt")
#str(groupedMeanStdData) # 'data.frame':	180 obs. of  81 variables:

print("5.groupedMeanStdData is the tidy dataset created for a separate data with a summary of avg values per subject and activity")
print(" The file mean_std_groupby_subject_activity.txt was created which contains new tidy data set")
setwd(old_dir)