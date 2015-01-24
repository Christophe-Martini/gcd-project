run_analysis<-function(){
#You should create one R script called run_analysis.R that does the following. 

#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names. 
#5 From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable for each activity and each subject.

#The Run_analysis script goes in the "UCI HAR Dataset" directory 
# which also contains the train and test folders
projectDirectory<-"./UCI HAR Dataset/"

library(data.table)

testDirectory<-"./test"
trainDirectory<-"./train"

#Getting dataset as table from "x_test.txt" file
x_test<-read.table(paste(testDirectory,"/x_test.txt",sep=""),stringsAsFactors=FALSE)
#Getting dataset as table from "features.txt" 
features<-read.table("features.txt",stringsAsFactors=FALSE)
#Cleaning data from features dataset so as to become readable column names
#to replace those from x_test dataset
names(x_test)<-tolower(as.character(sub("()", "", features[,2], fixed = TRUE)))

#Keep only vectors with column name containing mean() or std() in their string
filtercols<-regexpr("\\-(mean|std)(-|$)",names(x_test))>0
xtest<-x_test[filtercols]
colnames(xtest)<-gsub("body", "", colnames(xtest), fixed = TRUE)
rm(x_test)


#Getting dataset as table from "subject_test.txt" 
subject_id_test<-read.table(paste(testDirectory,"/subject_test.txt",sep=""))
#Rename first colum name by "subjectid"
names(subject_id_test)<-"subjectid"

#Getting dataset as table from "y_test.txt" 
y_test<-read.table(paste(testDirectory,"/y_test.txt",sep=""))
names(y_test)<-"activity"

ytest<-data.frame(activity=as.character(y_test[,1]),stringsAsFactors=FALSE)
#remove from memory useless object(s)
rm(y_test)

#Merging subject_id, y_test and xtest datasests together as a data.table
mergedtest<-data.frame(subject_id_test,ytest,xtest,stringsAsFactors=FALSE)
colnames(mergedtest)<-gsub(".", "", colnames(mergedtest), fixed = TRUE)
#remove from memory useless object(s)
rm(subject_id_test,ytest,xtest)

#mergedtest<-x_test[,(regexpr("(mean)|(std)",names(x_test)>0)==TRUE)]
#mergedtest<-x_test[,(regexpr("\\-mean\\-|\\-std\\-",names(x_test)>0)==TRUE]
#mergedtest<-x_test[,(regexpr("\\-mean\\-|\\-std\\-",names(x_test)>0)==TRUE]
#filtercols<-regexpr("\\-mean$|\\-std$",names(x_test))>0

#Getting dataset as table from "x_train.txt" file
x_train<-read.table(paste(trainDirectory,"/x_train.txt",sep=""),stringsAsFactors=FALSE)
#Cleaning data from features dataset so as to become readable column names
#to replace those from x_train dataset
names(x_train)<-tolower(as.character(sub("()", "", features[,2], fixed = TRUE)))
xtrain<-x_train[filtercols]
colnames(xtrain)<-gsub("body", "", colnames(xtrain), fixed = TRUE)
#remove from memory useless object(s)
rm(features,x_train)
#Getting dataset as table from "subject_train.txt" 
subject_id_train<-read.table(paste(trainDirectory,"/subject_train.txt",sep=""))
#Rename first colum name by "subject_id"
names(subject_id_train)<-"subjectid"

#Getting dataset as table from "y_train.txt" 
y_train<-read.table(paste(trainDirectory,"/y_train.txt",sep=""))
names(y_train)<-"activity"

ytrain<-data.frame(activity=as.character(y_train[,1]),stringsAsFactors=FALSE)
#remove from memory useless object(s)
rm(y_train)

#Merging subject_id_train, ytrain and xtrain datasests together as a data.table
mergedtrain<-data.frame(subject_id_train,ytrain,xtrain,stringsAsFactors=FALSE)
colnames(mergedtrain)<-gsub(".", "", colnames(mergedtrain), fixed = TRUE)
#remove from memory useless object(s)
rm(subject_id_train,ytrain,xtrain)
#Merging mergedtrain and mergedtest data.tabless all together
mergedata<-rbindlist(list(mergedtest,mergedtrain),use.names=TRUE)
rm(mergedtest,mergedtrain)

#recoding variable "activity" in mergedata data.table
# according to the information given by the "activity_labels.txt" file
#1 WALKING
#2 WALKING_UPSTAIRS
#3 WALKING_DOWNSTAIRS
#4 SITTING
#5 STANDING
#6 LAYING

mergedata[activity==1,activity:="WALKING"]
mergedata[activity==2,activity:="WALKING_UPSTAIRS"]
mergedata[activity==3,activity:="WALKING_DOWNSTAIRS"]
mergedata[activity==4,activity:="SITTING"]
mergedata[activity==5,activity:="STANDING"]
mergedata[activity==6,activity:="LAYING"]


#writing the data.tables into a file named "gcd_project.txt"
print("Write data file in gcd_project.txt")
write.table(mergedata,"./gcd_project.txt")

tidydata<-summarise_each(tidy,funs(mean),3:68)

}

