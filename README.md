# gcd-project
Getting and Cleaning Data Course Project
========================================

The gcd-project repo includes the following files :

'README.md'

'codebook.md'

'run_analysis.R' 

'tidydata.txt'


NOTE :

The Run_analysis script goes in the "UCI HAR Dataset" directory which
also contains the train and test folders

data.table and dplyr pakages are required to install

##COURSE PROJECT :

The purpose of this project is to demonstrate our ability to collect, work with,
and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The project consisted in elaborating a clean dataset from data disptached in
the multiple separate following files :

- features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels

Here are the data for the project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##STEPS :

###First step:

The process of getting and cleaning data leads to select variables
from the test and training sets files that are relevant for the project only.

That is, measurements on the mean and standard deviation for each measurement
(66 variables) were selected among 561 variables.

(see the codebook.md for further details).

The Run_analysis script does the merging of all the data coming from these various 
files so as to obtain a dataset that contains variables such as :

- the identifiers of the 30 volunteers (subjectid)

- the descriptive activity names to name the activities performed by each volunteer
  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
  
- 66 variables related to measurements on the mean and standard deviation only.

###

The names for variables in Test and Training set are found in features.txt file
(561 features). Before replacing the 66 variable names selected they are cleaned
from various defaults (see codebook for furher details).

 - strings "BodyBody" in variable names have been converted in "body"

 - strings "()" in variable names have been removed

 - every string "-" in variable names have been removed and all the strings were lowered


A first data set (mergedtest) is built on merging all data previously manuipulated
and relevant about test set.

A second data set (mergedtrain) is also built on the same way for data relevant about
train set.

Eventually, mergedtest and mergedtrain datasets are merged together (mergedata) using rbindlist()
function from data.table library.

The last manipulation for this first step consists in replacing the numeric values
for activity variable by those more descriptive found in activity_labels.txt file
(6 activities). These values replace the corresponding values (1,2,3,4,5,6)
from the 'activity' variable.

                1 WALKING
                2 WALKING_UPSTAIRS
                3 WALKING_DOWNSTAIRS
                4 SITTING
                5 STANDING
                6 LAYING

Thus, giving the intermediary dataset to perform further operations onto.
 
 (see also comments included in 'run_analysis.R' for further details).

###Second step :

It was asked to perform from the previous data set an independant tidy data set
with the average of each variable for each activity and each subject.

To make this operation, I used dplyr package and its group_by() function.

        tidy<-group_by(tbl,activity,subjectid)
        tidydata<-summarise_each(tidy,funs(mean),3:68)

The result from this step is the tidydata.txt included in this repo.






