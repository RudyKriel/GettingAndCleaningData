#Download zip file and unzip it
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="AssignmentDataset.zip")
if(!file.exists("./extract")){dir.create("./extract")}
unzip(zipfile="AssignmentDataset.zip",exdir="./extract")

#Read in the Labels and clean them up using grep, gsub and regex
labelNames <- read.fwf("./extract/UCI HAR Dataset/features.txt", widths = c(50), 
                       header = FALSE, sep = "", n = -1, col.names = c("colNum", "colName"))

#Cleanup the label names for Mean, Std Deviation measures
vecLabelNames <- labelNames$colName
vecLabelNames <- gsub("\\-[Mm]ean","Mean",vecLabelNames)
vecLabelNames <- gsub("\\-[Ss]td","Std",vecLabelNames)
#vecLabelNames <- gsub("\\-[Ss]td","StandardDeviation",vecLabelNames) #This made the table names too long
vecLabelNames <- gsub("-","",vecLabelNames)
vecLabelNames <- gsub("\\(","",vecLabelNames)
vecLabelNames <- gsub("\\)","",vecLabelNames)
vecLabelNames <- gsub("\\.","",vecLabelNames)
vecLabelNames <- gsub(",","",vecLabelNames)
vecLabelNames <- gsub("^t","time",vecLabelNames)
vecLabelNames <- gsub("^f","frequency",vecLabelNames)
#vecLabelNames <- gsub("Acc","Accelerometer",vecLabelNames)
#vecLabelNames <- gsub("Gyro","Gyroscope",vecLabelNames)
#vecLabelNames <- gsub("Mag","Magnitude",vecLabelNames)
#vecLabelNames <- gsub("gravity","Gravity",vecLabelNames)
#vecLabelNames <- gsub("BodyBody","Body",vecLabelNames)


#Read in the files for X_train, y_train and X_test, y_test --Fixed width files
xTrainDs <- read.fwf("./extract/UCI HAR Dataset/train/X_train.txt", widths = c(8977), 
                     header = FALSE, sep = "", n = -1, col.names = vecLabelNames)

yTrainDs <- read.fwf("./extract/UCI HAR Dataset/train/y_train.txt", widths = c(1), 
                     header = FALSE, sep = "", n = -1, col.names = c("activityCode"))


xTestDs <- read.fwf("./extract/UCI HAR Dataset/test/X_test.txt", widths = c(8977), 
                    header = FALSE, sep = "", n = -1, col.names = vecLabelNames)

yTestDs <- read.fwf("./extract/UCI HAR Dataset/test/y_test.txt", widths = c(1), 
                    header = FALSE, sep = "", n = -1, col.names = c("activityCode"))


#Get the Subject Data
subjectTestDs <- read.fwf("./extract/UCI HAR Dataset/test/subject_test.txt", widths = c(2), 
                          header = FALSE, sep = "", n = -1, col.names = c("subject"))

subjectTrainDs <- read.fwf("./extract/UCI HAR Dataset/train/subject_train.txt", widths = c(2), 
                           header = FALSE, sep = "", n = -1, col.names = c("subject"))

#cbind activities from Y to train and test X data
dsTest <- cbind(yTestDs, subjectTestDs, xTestDs)
dsTrain <- cbind(yTrainDs, subjectTrainDs, xTrainDs)

#row bind train & test datasets with activity labels
dsCombined <- rbind(dsTest,dsTrain)

#Add Label and column to y data by joining to activity_labels on the final dataset as to avoid re-ordering with the merge statement
ativityLabels <- read.fwf("./extract/UCI HAR Dataset/activity_labels.txt", widths = c(50), 
                          header = FALSE, sep = "", n = -1, col.names = c("activityCode", "activityName"))

library(dplyr)
dsMerged = merge(dsCombined,ativityLabels,by.x="activityCode",by.y="activityCode")

#select from the big dataset the columns needed in the tidy dataset
dsStdMeanNames <- grep(".Mean|Std",names(dsMerged))
dsStdMeanNames <- c(564,2,dsStdMeanNames) #Add activityName to the dimensions to select

dsStdMean <- select(dsMerged, dsStdMeanNames)
dsStdMean$subject <- as.factor(dsStdMean$subject)

#Group by ActivityName and Subject
library("plyr")

tblStdMean <- tbl_df(dsStdMean)

tblSummary <- tblStdMean %>% group_by(activityName, subject) %>% summarise_all(funs(mean))

#Check that the directory exists and export to CSV
if(!file.exists("./output")){dir.create("./output")}
write.csv(tblSummary, file = "./output/TidyDataSummary.csv", row.names=FALSE)

