## Getting and cleaning data
#  Week 3 Course Project

The run_analysis.R performs the following step:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# From raw data to tidy data
a. Use read.table to read the needed data in R and naming columns. The following data was used:
- activity_labels.txt
- features.txt
- subject_test.txt
- X_test.txt
- y_test.txt
- subject_train.txt
- X_train.txt
- y_train.txt

b. Subset the colummn names containing mean() OR std() from the data files containing the features

c. Use cbind on test data and train data to merge together: Subject, Activity and Features

d. Merge the data and train data together using rbind

e. Summarise the tidy data set with the average of each variable for each activity and each subject

f. Create a txt file o summarise_DT



