# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
features = read.table("features.txt", stringsAsFactors = FALSE)

test = read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test) = features[,2]
test_subject = read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(test_subject) = "subject"
test_activity = read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test_activity) = "activity"
test = cbind(test_subject,test_activity,test)

train = read.table("UCI HAR Dataset/train/X_train.txt")
colnames(train) = features[,2]
train_subject = read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(train_subject) = "subject"
train_activity = read.table("UCI HAR Dataset/train/y_train.txt")
colnames(train_activity) = "activity"
train = cbind(train_subject,train_activity,train)

data_set = rbind(test,train)
data_set = select(data_set, subject, activity, contains("mean()"), contains("std()"))
data_set = select(data_set, -contains("meanFreq()"), -contains("angle()"))

label = read.table("activity_labels.txt", stringsAsFactors = FALSE)
data_set = merge(label,data_set,by.x = "V1",by.y = "activity",all.y = TRUE)
data_set = data_set[,-1]
names(data_set)[names(data_set)=="V2"] <- "activity"

groups = split(data_set,list(data_set$subject,data_set$activity),drop = TRUE)
tidy = sapply(groups, function(x) colMeans(x[,-(1:2)]))
tidy = t(tidy)
name = row.names(tidy)
split_name =sapply(name, function(x) strsplit(x, ".", fixed = TRUE))
split_name = unlist(split_name)
split_name = matrix(split_name,length(split_name)/2,2,byrow = TRUE)
subject = split_name[,1]
activity = split_name[,2]
tidy = cbind(subject,activity,tidy)

write.table(tidy,"tidy_data_set.txt",row.name = FALSE)