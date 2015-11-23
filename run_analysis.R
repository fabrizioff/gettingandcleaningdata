# Date: 2015-11-22
# This R script, run_analysis.R, that does the following: 
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each measurement. 
# - Uses descriptive activity names to name the activities in the data set
# - Appropriately labels the data set with descriptive variable names. 
# - From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

### a. Use read.table to read the needed data in R and naming columns ###
# Read activity and features labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("IdActivity", "DescActivity"))
features <- read.table("./UCI HAR Dataset/features.txt")

# Read test data and assign column names
sbj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("Subject"))
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$V2)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("IdActivity"))

# Read train data and assign column names
sbj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("Subject"))
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("IdActivity"))

### b. Subset the col names containing mean() OR std() from x_test and y_test 
#      and use DescActivity instead of Id Activity ###
sub_x_test <- x_test[, grepl("mean()", colnames(x_test)) | grepl("std()", colnames(x_test))]
sub_x_train <- x_train[, grepl("mean()", colnames(x_train)) | grepl("std()", colnames(x_train))]
desc_y_test <- merge(activity_labels, y_test, by.x = "IdActivity", by.y = "IdActivity", all=TRUE)
desc_y_train <- merge(activity_labels, y_train, by.x = "IdActivity", by.y = "IdActivity", all=TRUE)

### c. Cbind test data and train data ###
cbind_test <- cbind(sbj_test, desc_y_test, sub_x_test)
cbind_train <- cbind(sbj_train, desc_y_train, sub_x_train)

### d. Merge data and train data
DT <- rbind(cbind_test, cbind_train) 

### e. Summarise in tidy data set with the average of each variable for each activity and each subject
summarise_DT <- DT %>% group_by(Subject, DescActivity) %>% summarise_each(funs(mean))

### Create a txt file o summarise_DT
write.table(summarise_DT, file = "./summarise_DT.txt", row.name = FALSE)
