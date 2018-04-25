# Sets the working directory

setwd("./Data Science Specialization/Course 03 - Getting and Cleaning Data/UCI HAR Dataset/")

# Reads activity and features files, extracts the relevant information, prepares features_vect for further processing.

activity <- read.table("activity_labels.txt")
activity_vect <- activity[,2]
features <- read.table("features.txt")
features_vect <- features[,2]
features_vect <- sub("\\(\\)", "FUN", features_vect)

# Reads subject and test information and measurements, merges by train and test data, then merges all.

subject_train <- read.table("train/subject_train.txt", col.names = "Subject")
X_train <- read.table("train/X_train.txt", col.names = features_vect)
y_train <- read.table("train/y_train.txt", col.names = "Activity")

train <- cbind(subject_train, y_train, X_train)

subject_test <- read.table("test/subject_test.txt", col.names = "Subject")
X_test <- read.table("test/X_test.txt", col.names = features_vect)
y_test <- read.table("test/y_test.txt", col.names = "Activity")

test <- cbind(subject_test, y_test, X_test)

data <- rbind(train, test)

# Extracts the relevant variables (Subject, Activity and all variables representing calculated mean and standard deviation) from the merged dataset

data1 <- data[, grepl("Subject|Activity|meanFUN|stdFUN", colnames(data))]

# Relabels activity with its actual name

for (i in 1:6){
  data1$Activity <- sub(i, activity_vect[i], data1$Activity)
}

# Relabels the variables with more comprehensive names

colnames <- colnames(data1)
colnames <- sub("FUN","", colnames)
colnames <- sub("^t", "Time", colnames)
colnames <- sub("^f", "Frequency", colnames)
colnames <- sub("Acc", "Acceleration", colnames)
colnames <- sub("Gyro", "Gyroscope", colnames)
colnames <- sub("Mag", "Magnitude", colnames)
colnames(data1) <- colnames

# Calculates a summary dataset containing the mean of all variables, grouped by subject x activity

library(dplyr)
data1 %>% group_by(Subject, Activity) %>% summarize_all(mean) -> sumdata