# Load in all data sets. 
test <- read.table("./test/X_test.txt")
test_activities <- read.table("./test/y_test.txt")
test_subjects <- read.table("./test/subject_test.txt")
train <- read.table("./train/X_train.txt")
train_activities <- read.table("./train/y_train.txt")
train_subjects <- read.table("./train/subject_train.txt")
labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# Change the features so they are readable.
head(features)
features$V3 <- gsub("-","", features$V2)
features$V3 <- gsub("\\(\\)","", features$V3)
features$V3 <- gsub("mean","Mean", features$V3)
features$V3 <- gsub("std","Std", features$V3)
features$V3 <- gsub("BodyBody","Body", features$V3)

# Uses descriptive activity names;
# appropriately label the data set with descriptive variable names. 
colnames(features) <- c("Col_num", "original", "feature")
colnames(labels) <- c("ActivityCode", "Activity")
colnames(test) <- features$feature
colnames(train) <- features$feature
colnames(test_subjects) <- "Subject"
colnames(test_activities)<- c("ActivityCode")
colnames(train_subjects) <- "Subject"
colnames(train_activities)<- c("ActivityCode")

# Bind the relevent columns together.
test_data <- cbind(test_subjects, test_activities, test)
train_data <- cbind(train_subjects, train_activities, train)

# Combine the training and the test sets to create one data set.
data <- rbind(train_data, test_data)

# Merge the Activity names into the data frame. 
data <- merge(labels,data)

# Extract only the measurements on the mean and standard deviation for each 
# measurement. Exclude the mean Freq and the angle means. 

names <- names(data)
meanstd <- sapply(names[4:length(names)], function(x) grep("Mean|Std", x))
logical_sorter <- c(NA, 1, 1, as.logical(meanstd))
data_mean_sd <- data[,!is.na(logical_sorter)]

names <- names(data_mean_sd)
removeanglesfreq <- sapply(names[3:length(names)], function(x) 
                              grep("MeanFreq|angle", x, invert = TRUE))
logical_sorter <- c(1, 1, as.logical(removeanglesfreq))
rel_data <- data_mean_sd[,!is.na(logical_sorter)]

#Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 

agg_data <- aggregate(. ~ Activity + Subject, data = rel_data[], mean)
agg_data <- arrange(agg_data, Activity)

# write the agg data to file
write.table(agg_data, "agg_data.txt")
