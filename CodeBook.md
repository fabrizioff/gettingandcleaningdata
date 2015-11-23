## CodeBook Assignment Week 3

# Raw data
Human Activity Recognition Using Smartphones Dataset

Two data set (test and train) containing:
- A 561-feature vector with time and frequency domain variables (normalized between -1 and 1). 
- Its activity label (i.e. "WALKING"). 
- An identifier of the subject who carried out the experiment (1 to 30).

# Processed data
The tidy data contain the folowing variables:
- An identifier of the subject who carried out the experiment (1 to 30).
- Its activity description (i.e. WALKING). 
- The average of the features containing mean() and std() in their name from raw data (i.e. normalized between -1 and 1)

The final output is a dataset with the average of each variable for each activity and each subject