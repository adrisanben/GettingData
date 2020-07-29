CODE BOOK
The run_analyis.R script follows the instructions given for the project

Variables 

subjecttest
2947 rows, 1 column 
Each row identifies the subject who performed the activity for each window sample

xtest
2947 rows, 561 columns 
contains the test set

ytest
2947 rows, 1 columns 
contains test labels

subjecttrain
7352 rows, 1 column 
Each row identifies the subject who performed the activity for each window sample

xtrain
7352 rows, 561 columns
training data

ytrain
7352 rows, 1 columns
labels of training data

features
561 rows, 2 columns 
list of all features measured in the test

activitylabels
6 rows, 2 columns
links the class label with the activity name

mergeddata
10299 rows, 563 column
merges the xtest, ytest, xtrain, ytrain, subjecttrain and subjecttest variables using cbind and rbind

meanstd
this is created to separate all the variables that include mean and standard deviation from mergeddata

sepmeanstd
this is a dataframe that includes only the means and standard deviations

setactnames
activity names were set by merging sepmeanstd and activitylabels by the activity number 

FinalData
180 rows, 88 columns
is created by sumarizing setactnames taking the means of each variable for each activity and each subject, after groupped by subject and activity.

name replacements:
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time





