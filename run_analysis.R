setwd("C:/Users/slipsky/Desktop/Coursera")

TrainData<-read.table("cleaningproject/Training/X_train.txt",header=FALSE)
TestData<-read.table("cleaningproject/Test/X_test.txt",header=FALSE)
ColNames<-read.table("cleaningproject/features.txt",header=FALSE)

names(TrainData)<-ColNames[,2]
names(TestData)<-ColNames[,2]

TrainActivity<-read.table("cleaningproject/Training/Y_train.txt",header=FALSE)
TestActivity<-read.table("cleaningproject/Test/Y_test.txt",header=FALSE)

names(TrainActivity)<-"Activity"
names(TestActivity)<-"Activity"

TrainSubjects<-read.table("cleaningproject/Training/subject_train.txt",header=FALSE)
TestSubjects<-read.table("cleaningproject/Test/subject_test.txt",header=FALSE)

names(TrainSubjects)<-"Subject"
names(TestSubjects)<-"Subject"

ActivityLabels<-read.table("cleaningproject/activity_labels.txt",header=FALSE)

names(ActivityLabels)<-c("V1","Activity")

FullTrain<-cbind(TrainSubjects,TrainActivity,TrainData)
FullTest<-cbind(TestSubjects,TestActivity,TestData)


####ANSWER TO QUESTION 1:
FullData<-rbind(FullTrain,FullTest)


NewCols<-grep("std|mean\\(\\)",ColNames[,2],value=TRUE)

####ANSWER TO QUESTION 2:
FullData2<-FullData[c("Activity","Subject",NewCols)]

##ADD DESCRIPTIONS FOR ACTIVITY
FullData3<-merge(ActivityLabels,FullData2,by.x="V1",by.y="Activity",all=FALSE)

##Remove the Join field from the Activity Lookup Table
drops <- c("V1")

####ANSWER TO QUESTION 3:
FullData4<-FullData3[,!(names(FullData3) %in% drops)]


##changing field names
####ANSWER TO QUESTION 4:
names(FullData4)<-sub("\\(\\)","",names(FullData4),)
names(FullData4)<-sub("tB","TimeB",names(FullData4))
names(FullData4)<-sub("fB","FrequencyB",names(FullData4))
names(FullData4)<-sub("tG","TimeG",names(FullData4))
names(FullData4)<-sub("Acc","Acceleration",names(FullData4))
names(FullData4)<-gsub("-","",names(FullData4))
names(FullData4)<-sub("mean","MeanValue",names(FullData4))
names(FullData4)<-sub("std","StdDev",names(FullData4))
names(FullData4)<-sub("Y","Yaxis",names(FullData4))
names(FullData4)<-sub("X","Xaxis",names(FullData4))
names(FullData4)<-sub("Z","Zaxis",names(FullData4))
names(FullData4)<-sub("BodyBody","Body",names(FullData4))
names(FullData4)<-sub("Mag","Magnitude",names(FullData4))


##bring PLYR package into R
library(plyr)

##Provide the MEAN for each numerical column, grouped by Activity and Subject
Avgs<-ddply(FullData4,c("Activity","Subject"),numcolwise(mean))

####ANSWER TO QUESTION 5:
##write.csv(Avgs, file = "Answer5.csv") - will not work on coursera uploads
write.table(Avgs,file="TidyData.txt",sep=",",col.names=TRUE,row.names=FALSE)
