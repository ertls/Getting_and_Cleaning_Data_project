Getting_and_Cleaning_Data_project
=================================
Description of run_analysis.R:
------------------------------
1. Read files
2. Merge test and training dataset (harusd: Human Activity Recognition Using Smartphones Dataset)
3. Label columns of data frame tbl. harusd
4. Extract only the measurements on the mean and standard deviation for each measurement
5. Use descriptive activity names to name the activities in the data set
6. From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject. (average_harusd)
7. Required output

Code Book
---------
average_harusd

180 observations from each subject (30) and each activity(6)

activity is described in 1st row

subject number in 2nd row

both as labeled in the original data files (-> see also README.txt in the original data)

each following row (3:42) mean of the different observations for each activity and each subject

each labeled as in the original data files (-> activity_labels.txt)
