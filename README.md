# run_analysis
This repository is where I store all the work I did through the getting and cleaning data course

It includes the files:
codebook.Rmd 
which is where i describe the peer graded assignment variables and transformations made 

run_analysis.R 
which is a file that follows the instructions given for the assignment
First it downloades and reads the files, then it merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set. Appropriately labels the data set with descriptive variable names. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Finally it creates a .txt file

FinalData2.txt
is the file where all the tidy data is stored after the procedure described above.
