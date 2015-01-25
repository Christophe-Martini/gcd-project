# gcd-project
Getting and Cleaning Data Course Project
========================================

Features selection in tidydata
=============================

- subjectid : identifiers of the 30 volunters

- activity : activity names of the activities performed by each volunters

The features selected for this database come from an accelerometer and gyroscope 3-axial raw signals. 

Measurements on the mean and standard deviation for each measurement (66 variables)
were selected only upon 561 variables.

Thus variable names in the tidata base either contain 

        - 'mean' to denote measurements on the mean

OR

        - 'std'  to denote measurements on the standard deviation
        
Other strings which may be included in variable names correspond respectively to

- prefix 't' to denote time

- prefix 'f' to denote frequency

- 'bodyacc'  to denote body acceleration signals (from accelerometer sensor)

- 'gravityacc'  to denote gravity acceleration signals (from accelerometer sensor)

- 'bodygyro'  to denote body gyroscopic signals (from gyroscope sensor)

- 'jerk' to denote Jerk signals ( derived from the body linear acceleration and angular velocity)

- 'mag' to denote magnitude signals (derived from the body linear acceleration and angular velocity)

-  'x' 'y' 'z' denote the three-dimensional signals (3-axial signals) in the X, Y and Z directions




##VARIABLE CLEANING STEPS
=======================

some steps were necessary so as to make variable names tidy

strings "BodyBody" in variable names have been converted in "body"

- keepedfeaturestreated<-sub("BodyBody", "Body", keepedfeatures, fixed = TRUE)

strings "()" in variable names have been removed

- keepedfeaturestreated<-sub("()", "", keepedfeaturestreated, fixed = TRUE)

every string "-" in variable names have been removed and all the strings were lowered

- keepedfeaturestreated<-tolower(as.character(gsub("-", "", keepedfeaturestreated, fixed = TRUE)))


Below is the result of the cleaning process for each variable names conserved


ORIGINAL VARIABLE NAMES -> VARIABLE NAMES AFTER CLEANING

tBodyAcc-mean()-X -> tbodyaccmeanx

tBodyAcc-mean()-Y -> tbodyaccmeany

tBodyAcc-mean()-Z -> tbodyaccmeanz

tBodyAcc-std()-X -> tbodyaccstdx

tBodyAcc-std()-Y -> tbodyaccstdy

tBodyAcc-std()-Z -> tbodyaccstdz

tGravityAcc-mean()-X -> tgravityaccmeanx

tGravityAcc-mean()-Y -> tgravityaccmeany

tGravityAcc-mean()-Z -> tgravityaccmeanz

tGravityAcc-std()-X -> tgravityaccstdx

tGravityAcc-std()-Y -> tgravityaccstdy

tGravityAcc-std()-Z -> tgravityaccstdz

tBodyAccJerk-mean()-X -> tbodyaccjerkmeanx

tBodyAccJerk-mean()-Y -> tbodyaccjerkmeany

tBodyAccJerk-mean()-Z -> tbodyaccjerkmeanz

tBodyAccJerk-std()-X -> tbodyaccjerkstdx

tBodyAccJerk-std()-Y -> tbodyaccjerkstdy

tBodyAccJerk-std()-Z -> tbodyaccjerkstdz

tBodyGyro-mean()-X -> tbodygyromeanx

tBodyGyro-mean()-Y -> tbodygyromeany

tBodyGyro-mean()-Z -> tbodygyromeanz

tBodyGyro-std()-X -> tbodygyrostdx

tBodyGyro-std()-Y -> tbodygyrostdy

tBodyGyro-std()-Z -> tbodygyrostdz

tBodyGyroJerk-mean()-X -> tbodygyrojerkmeanx

tBodyGyroJerk-mean()-Y -> tbodygyrojerkmeany

tBodyGyroJerk-mean()-Z -> tbodygyrojerkmeanz

tBodyGyroJerk-std()-X -> tbodygyrojerkstdx

tBodyGyroJerk-std()-Y -> tbodygyrojerkstdy

tBodyGyroJerk-std()-Z -> tbodygyrojerkstdz

tBodyAccMag-mean() -> tbodyaccmagmean

tBodyAccMag-std() -> tbodyaccmagstd

tGravityAccMag-mean() -> tgravityaccmagmean

tGravityAccMag-std() -> tgravityaccmagstd

tBodyAccJerkMag-mean() -> tbodyaccjerkmagmean

tBodyAccJerkMag-std() -> tbodyaccjerkmagstd

tBodyGyroMag-mean() -> tbodygyromagmean

tBodyGyroMag-std() -> tbodygyromagstd

tBodyGyroJerkMag-mean() -> tbodygyrojerkmagmean

tBodyGyroJerkMag-std() -> tbodygyrojerkmagstd

fBodyAcc-mean()-X -> fbodyaccmeanx

fBodyAcc-mean()-Y -> fbodyaccmeany

fBodyAcc-mean()-Z -> fbodyaccmeanz

fBodyAcc-std()-X -> fbodyaccstdx

fBodyAcc-std()-Y -> fbodyaccstdy

fBodyAcc-std()-Z -> fbodyaccstdz

fBodyAccJerk-mean()-X -> fbodyaccjerkmeanx

fBodyAccJerk-mean()-Y -> fbodyaccjerkmeany

fBodyAccJerk-mean()-Z -> fbodyaccjerkmeanz

fBodyAccJerk-std()-X -> fbodyaccjerkstdx

fBodyAccJerk-std()-Y -> fbodyaccjerkstdy

fBodyAccJerk-std()-Z -> fbodyaccjerkstdz

fBodyGyro-mean()-X -> fbodygyromeanx

fBodyGyro-mean()-Y -> fbodygyromeany

fBodyGyro-mean()-Z -> fbodygyromeanz

fBodyGyro-std()-X -> fbodygyrostdx

fBodyGyro-std()-Y -> fbodygyrostdy

fBodyGyro-std()-Z -> fbodygyrostdz

fBodyAccMag-mean() -> fbodyaccmagmean

fBodyAccMag-std() -> fbodyaccmagstd

fBodyBodyAccJerkMag-mean() -> fbodyaccjerkmagmean

fBodyBodyAccJerkMag-std() -> fbodyaccjerkmagstd

fBodyBodyGyroMag-mean() -> fbodygyromagmean

fBodyBodyGyroMag-std() -> fbodygyromagstd

fBodyBodyGyroJerkMag-mean() -> fbodygyrojerkmagmean

fBodyBodyGyroJerkMag-std() -> fbodygyrojerkmagstd

