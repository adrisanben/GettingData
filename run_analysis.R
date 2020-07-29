#Open Libraries
library(dplyr)
library(data.table)
 
#Read Files: Test
subjecttest <- read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/test/y_test.txt")

#Read Files: Train
subjecttrain <- read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/train/y_train.txt")

#Read Files: feature
features <- read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/features.txt")
activitylabels = read.table("/Users/adrianasantibanez/Documents/LearningR/DataScienceCoursera/UCI HAR Dataset/activity_labels.txt")

#Assign Column Names that can easily be merged
colnames(features) <- c("no", "features")
colnames(xtrain) <- features[ ,2]
colnames(ytrain) <-"activity"
colnames(subjecttrain) <- "subject"
colnames(xtest) <- features[ ,2]
colnames(ytest) <- "activity"
colnames(subjecttest) <- "subject"
colnames(activitylabels) <- c("activity","activitytype")


#Merge all data
mergeddata <- rbind(cbind(ytrain, subjecttrain, xtrain),cbind(ytest, subjecttest, xtest))

#Get mean and std for each
colNames <- colnames(mergeddata)
meanstd <- (grepl("activity" , colNames) | grepl("subject" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
sepmeanstd <- mergeddata[ ,meanstd==TRUE]
  
#Name the activities (Descriptive activity Names)
setactnames <- merge(sepmeanstd, activitylabels, by='activity', all.x=TRUE)

#Nice and undestandable names (Descriptive variable names)
names(setactnames)<-gsub("Acc", "Accelerometer", names(setactnames))
names(setactnames)<-gsub("Gyro", "Gyroscope", names(setactnames))
names(setactnames)<-gsub("BodyBody", "Body", names(setactnames))
names(setactnames)<-gsub("Mag", "Magnitude", names(setactnames))
names(setactnames)<-gsub("^t", "Time", names(setactnames))
names(setactnames)<-gsub("^f", "Frequency", names(setactnames))
names(setactnames)<-gsub("tBody", "TimeBody", names(setactnames))
names(setactnames)<-gsub("-mean()", "Mean", names(setactnames), ignore.case = TRUE)
names(setactnames)<-gsub("-std()", "STD", names(setactnames), ignore.case = TRUE)
names(setactnames)<-gsub("-freq()", "Frequency", names(setactnames), ignore.case = TRUE)
names(setactnames)<-gsub("angle", "Angle", names(setactnames))
names(setactnames)<-gsub("gravity", "Gravity", names(setactnames))

#Final Nice and Tidy Data with means
FinalData <- setactnames %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)








