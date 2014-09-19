datasciencecoursera
===================

The script run_analysis.r does the following:

* Reads in the training and testing data sets, together with information about the column names, subjects and activities.
* Appropriately labels the data set with descriptive variable names supplied.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Attaches the activity names to name the activities in the data set
* Creates a second data set with the average of each variable for each activity and each subject.

To run this script, make sure that the folder "UCI HAR Dataset" with all the Samsung data is in your working directory.
source(run_analysis.r)
The file "tidy_data_set.txt" will be created in your working directory.

For more information about the features in "tidy_data_set.txt", see CodeBook.md.