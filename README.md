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
the mutliple separate following files :

- features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels)

Here are the data for the project
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##STEPS :

###In a first step:

The process of getting and cleaning data leads to get ride off variables
from the test set and training set so as to keep the relevant variables to put in a 
data set (see the codebook.md for further explanations).

Thus, the Run_analysis script does the merging of all the data coming from these various 
files so as to obtain a dataset that contains variables such as

- the identifiers of the 30 volunters (subjectid)
- the descriptive activity names to name the activities performed by each volunters
  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
- only the variables related to measurements on the mean and standard deviation

  (see comments included in 'run_analysis.R' for further explanations).

###In a second step
It is asked to perform from the previous data set an independant tidy data set
with the average of each variables for each activity an each subjet.

Tto make this operation, I used plyr package and its group_by() function.

        tidy<-group_by(tbl,activity,subjectid)
        tidydata<-summarise_each(tidy,funs(mean),3:68)

The result from this step is the tidydata.txt included in this repo.






