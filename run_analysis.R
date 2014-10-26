library(dplyr)

#Read files
trainSet <- read.table("X_train.txt")
trainLabels <- read.table("y_train.txt")
trainSubjects <- read.table("subject_train.txt")
trainSet <- cbind(trainSubjects, trainLabels, trainSet)

testSet <- read.table("X_test.txt")
testLabels <- read.table("y_test.txt")
testSubjects <- read.table("subject_test.txt")
testSet <- cbind(testSubjects, testLabels, testSet)

#ad 1: Merge test and training dataset
harusd <- rbind(testSet, trainSet)
#(harusd: Human Activity Recognition Using Smartphones Dataset)

#Clean up
rm(trainSet, trainLabels, trainSubjects, testSet, testLabels, testSubjects)

#Create data frame tbl.
harusd <- tbl_df(harusd)

#ad 4: Label columns of data frame tbl. harusd
colNames <- read.table("features.txt", stringsAsFactors = FALSE)
colNames <- rbind("subject", "activity", colNames)
colNames <- colNames[,2]
names(harusd) <- colNames
rm(colNames)

#ad 2: Extract only the measurements on the mean and standard deviation for
# each measurement
index <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228,
           240, 241, 253, 254) + 2 #Column subject and activity first
index <- c(1, 2, index)
harusd <- harusd[,index]

# ad 3: Use descriptive activity names to name the activities in the data set
activityLabels <- read.table("activity_labels.txt")
harusd$activity <- factor(harusd$activity, labels = activityLabels[,2])
rm(activityLabels)

#ad 5: From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

average_harusd <- aggregate(harusd[[3]],
                            by = list(harusd$activity, harusd$subject), mean)
for (i in 4:42) {
        average_harusd[,i] <- aggregate(harusd[[i]],
                                    by = list(harusd$activity, harusd$subject), mean)[,3]
}
names(average_harusd)[c(1,2)] <- c("activity", "subject")
names(average_harusd)[c(3:42)] <- names(harusd)[c(3:42)]

#writes tidy data set average_harusd
write.table(average_harusd, file="means_grouped_by_subject_and_activity.txt",
            row.names = FALSE)
