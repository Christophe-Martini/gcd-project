#You should create one R script called run_analysis.R that does the following. 

#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names. 
#5 From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable for each activity and each subject.

#testDirectory<-"./UCI HAR Dataset/test/Inertial Signals"
#testFiles<-dir(testDirectory)

testDirectory<-"./test"
trainDirectory<-"./train"

testFiles<-dir(testDirectory)

#subject_id<-read.csv(paste(testDirectory,"/",testFiles[2],sep=""))
#subject_id<-read.table(paste(testDirectory,"/",testFiles[2],sep=""))

#x_test<-read.csv(paste(testDirectory,"/",testFiles[3],sep=""))
#x_test<-read.table(paste(testDirectory,"/x_test.txt",sep=""))
x_test<-read.table(paste(testDirectory,"/x_test.txt",sep=""),stringsAsFactors=FALSE)

features<-read.table("features.txt",stringsAsFactors=FALSE)
#featuresnames<-as.character(features[,2])
#rm(mergedtest)
names(x_test)<-as.character(sub("()", "", features[,2], fixed = TRUE))
#names(x_test)<-as.character(features[,2])
#names(x_test)<-featuresnames<-as.character(sub("()", "", features[,2], fixed = TRUE))
#mergedtest<-x_test[,(regexpr("(mean)|(std)",names(x_test)>0)==TRUE)]
mergedtest<-x_test[,(regexpr("\\-mean\\-|\\-std\\-",names(x_test)>0)==TRUE]
mergedtest<-x_test[,(regexpr("\\-mean\\-|\\-std\\-",names(x_test)>0)==TRUE]
filtercols<-regexpr("\\-mean$|\\-std$",names(x_test))>0
filtercols<-regexpr("\\-(mean|std)(-|$)",names(x_test))>0
mergedtest<-x_test[filtercols]

# set the column names of the x_test object.
#for(i in 1 :561){
#        if(regexpr("(mean\\(\\))|(std\\(\\))",features[i,2])>0){
#                print(features[i,2])
#                names(x_test)[i]<-sub("()", "", features[i,2], fixed = TRUE)        
#                print(dim(x_test[,i]))
                #mergedtest<-cbind(mergedtest,x_test[,i])      
#      }        
#}


#y_test<-read.table(paste(testDirectory,"/y_test.txt",sep=""))

#subject_train<-read.table(paste(trainDirectory,"/subject_train.txt",sep=""))
x_train<-read.table(paste(trainDirectory,"/x_train.txt",sep=""),stringsAsFactors=FALSE)
names(x_train)<-as.character(sub("()", "", features[,2], fixed = TRUE))
mergedtrain<-x_train[filtercols]
#y_train<-read.table(paste(trainDirectory,"/y_train.txt",sep=""),stringsAsFactors=FALSE)


#merged<-cbind(subject_id,x_test)
?colnames

