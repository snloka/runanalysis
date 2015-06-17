install.packages("RCurl")
library(RCurl)
install.packages("dplyr")
library(dplyr)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./UCI_HAR_Dataset.zip", method="libcurl")

unzip("./UCI_HAR_Dataset.zip")

activityfilename <- "./UCI HAR Dataset/activity_labels.txt"
activities <- read.csv(activityfilename, sep="", header=FALSE, colClasses=c("factor", "character"))
activities2 <- factor(activities[,2])

propfilename <- "./UCI HAR Dataset/features.txt"
propertylabels <- read.csv(propfilename, sep="", header=FALSE, colClasses=c("numeric", "character"))
propertylabels2 <- propertylabels[,2]
propertylabels3 <- grep("^.+-(mean[()]{2})|(std[()]{2}).*$", propertylabels2)
propertylabels4 <- c("subject", "activity", propertylabels2[propertylabels3])

testsubjectfilename <- "./UCI HAR Dataset/test/subject_test.txt"
testsubject <- read.csv(testsubjectfilename, sep="", header=FALSE, colClasses=c("numeric"))

testxfilename <- "./UCI HAR Dataset/test/X_test.txt"
testx <- read.csv(testxfilename, sep="", header=FALSE)

testyfilename <- "./UCI HAR Dataset/test/y_test.txt"
#testy <- read.csv(testyfilename, sep="", header=FALSE, colClasses=c("factor", activities2))
testy <- read.csv(testyfilename, sep="", header=FALSE)

trainsubjectfilename <- "./UCI HAR Dataset/train/subject_train.txt"
trainsubject <- read.csv(trainsubjectfilename, sep="", header=FALSE, colClasses=c("numeric"))

trainxfilename <- "./UCI HAR Dataset/train/X_train.txt"
trainx <- read.csv(trainxfilename, sep="", header=FALSE)

trainyfilename <- "./UCI HAR Dataset/train/y_train.txt"
trainy <- read.csv(trainyfilename, sep="", header=FALSE)

#tests <- cbind(testsubject, testy)
#tests <- cbind(tests, testx)
#colnames(tests) <- c("subject", "activity", propertylabels2)

tests2 <- cbind(testsubject, testy)
tests2 <- cbind(tests2, testx[,propertylabels3])
colnames(tests2) <- propertylabels4

#library(dplyr)
#tests2 <- mutate(tests2, activitylabel = activities2[activity])

train2 <- cbind(trainsubject, trainy)
train2 <- cbind(train2, trainx[,propertylabels3])
colnames(train2) <- propertylabels4

#train2 <- mutate(train2, activitylabel = activities2[activity])

final_data_set <- rbind(tests2, train2)
#final_data_set2 <- split(final_data_set, final_data_set[,final_data_set$subject])
#final_data_set3 <- split(final_data_set2, final_data_set2[,final_data_set2$activity])
#final_summary <- lapply(final_data_set3, 
#
#final_summary <- group_by(final_data_set, "subject", "activity")
#groupbyfields <-  final_data_set[,"subject"]+as.numeric(final_data_set[,"activity"])*0.1
#final_summary <- tapply(final_data_set, groupbyfields, mean)
#final_summary <- apply(final_data_set, 2, mean)
final_summary <- aggregate(final_data_set, by=list(final_data_set$subject, final_data_set$activity), FUN=mean, na.rm=TRUE )
final_summary2 <- final_summary[,3:70]
final_summary2 <- mutate(final_summary2, activity = activities2[activity])

write.table(final_summary2, file="final_summary2.txt", row.name=FALSE)

#install.packages("sqldf")
#library(sqldf)
#sqldf(" select 






