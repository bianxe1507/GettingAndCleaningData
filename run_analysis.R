# Download the dataset and 
if(!file.exists("./dataset")){dir.create("./dataset")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="./datadet/Dataset.zip")

# Unzip the file in the dataset file
unzip(zipfile="./dataset/Dataset.zip",exdir="./dataset")

# Merge the training set with the test set
x_train <- read.table("./dataset/UCI HAR Dataset/train/X_train.txt")

y_train <- read.table("./dataset/UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./dataset/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./dataset/UCI HAR Dataset/test/X_test.txt")

y_test <- read.table("./dataset/UCI HAR Dataset/test/y_test.txt")

subject_test <- read.table("./dataset/UCI HAR Dataset/test/subject_test.txt")

features <- read.table('./dataset/UCI HAR Dataset/features.txt')

activityLabels = read.table('./dataset/UCI HAR Dataset/activity_labels.txt')

# Merge the data

mrg_train <- cbind(y_train, subject_train, x_train)

mrg_test <- cbind(y_test, subject_test, x_test)

AllData <- rbind(mrg_train, mrg_test)

# Compute the mean and standard deviation

colNames <- colnames(AllData)

mean_and_std <- (grepl("activityId" , colNames) | 
                   
                   grepl("subjectId" , colNames) | 
                   
                   grepl("mean.." , colNames) | 
                   
                   grepl("std.." , colNames) 
                 
)

MeanAndStd <- AllData[ , mean_and_std == TRUE]

ActivityNames <- merge(MeanAndStd, activityLabels,
                              
                              by='activityId',
                              
                              all.x=TRUE)

# Creating your Tidy Data Set

TidyData <- aggregate(. ~subjectId + activityId, ActivityNames, mean)

TidyData <- TidyData[order(TidyData$subjectId, TidyData$activityId),]

write.table(TidyData, "TidyData.txt", row.name=FALSE)