
library(plyr)
setwd("~/Desktop")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=F)
features <- read.table("./UCI HAR Dataset/features.txt", header=F)

### Test Data 
x_test_file <- read.table("./UCI HAR Dataset/test/X_test.txt", header=F)
y_test_file <- read.table("./UCI HAR Dataset/test/y_test.txt", header=F)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=F)

colnames(x_test_file) = features[,2]
colnames(y_test_file) = "Activity_ID"
colnames(subject_test) = "subject_ID"
colnames(activity_labels) = c("Activity_ID", "Activity_type")

test_file <- cbind(subject_test, y_test_file, x_test_file)

### Train Data
x_train_file <- read.table("./UCI HAR Dataset/train/X_train.txt", header=F)
y_train_file <- read.table("./UCI HAR Dataset/train/y_train.txt", header=F)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=F)

colnames(x_train_file) = features[,2]
colnames(y_train_file) = "Activity_ID"
colnames(subject_train) = "subject_ID"

train_file <- cbind(subject_train, y_train_file, x_train_file)


#Merging Test & Train Data 
combined_data = rbind(test_file, train_file)
col_names <- colnames(combined_data)

combined <- combined_data[,grepl("mean|std|subject_ID|Activity_ID", colnames(combined_data))]
combined_2 <- join(combined, activity_labels, by="Activity_ID")

#Relabeling with descriptive variable names
names(combined_2) <- gsub("^t", "Time", names(combined_2))
names(combined_2) <- gsub("^f", "Frequency", names(combined_2))

#Averages for each activity and subject 
tidy_data<- ddply(combined_2, c("subject_ID","Activity_ID"), numcolwise(mean))
write.table(tidy_data, file = "./tidy_data.txt")