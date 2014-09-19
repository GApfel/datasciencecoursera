## This the Code Book for "tidy_data_set.txt"

The output "tidy_data_set.txt" is created from "run_analysis.r".
It includes 68 variables.

"subject" is an integer from 1 to 30 identifying the subject from whom the measurements were taken. 

"activity" is a description of the activity that the subject was doing while the measurements were taken.
These can be "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" or "LAYING".

The remaining 66 variables are the average measurements for each subject and activity combination.
33 measurements are summarized here, first the mean of each measurement is averaged, then the standard deviation of each measurement.
The measurements ending with -X, -Y or -Z are measurements that were taking in each of three planes.
The following measurements were summarized:
* tBodyAcc
* tGravityAcc
* tBodyAccJerk
* tBodyGyro
* tBodyGyroJerk
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc                 
* fBodyAccJerk         
* fBodyGyro                
* fBodyAccMag         
* fBodyBodyAccJerkMag 
* fBodyBodyGyroMag   
* fBodyBodyGyroJerkMag

