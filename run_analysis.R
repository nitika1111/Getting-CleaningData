# run_analysis.R
# for Coursera - JHU / Getting and Cleaning Data
# Please see codebook.md / Readme.md in Github repository for more information
# Prep:   Load files / Libraries

if (!require("plyr")) {
  install.packages("plyr")
}
require("plyr")
# Read raw data from files
features = read.table('./UCI HAR Dataset/features.txt',header=FALSE)[,2]
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)[,2]

X_train = read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)
y_train = read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
subject_train = read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# merge data into 3 logical subsets
x_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# extract mean / std from features
