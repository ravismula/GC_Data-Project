#### run_analysis.R

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject. 


## Step 1:

# Reading names from features.txt and creating a list of features
features <- read.table("UCI HAR Dataset/features.txt")
features <- as.character(features[,2])

# Reading data from X_test.txt and X_train.txt
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
data_x <- rbind(x_test,x_train)
colnames(data_x) <- as.list(features)

# Reading data from Y_test.txt and Y_train.txt 
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
data_y <- rbind(y_test,y_train)
colnames(data_y) <- "Activity"

# Reading data from subject_test.txt and subject_train.txt
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
data_sub <- rbind(sub_test,sub_train)
colnames(data_sub) <- "Subject"

# Creating a dataset
data <- cbind(data_y, data_sub, data_x)

# Writing dataset to a file
write.table(data, "tidydata.txt", sep="\t")

## Step 2:

to_analyse <- data[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,
                      123,124,125,126,127,128,163,164,165,166,167,168,203,
                      204,216,217,229,230,242,243,255,256,268,269,270,271,
                      272,273,347,348,349,350,351,352,426,427,428,429,430,
                      431,505,506,518,519,544,545)]

## Step 3:

for(i in 1:dim(to_analyse)[1]){
      if(to_analyse[,1][i] == 1) to_analyse[,1][i] <- "WALKING"
      else if(to_analyse[,1][i] == 2) to_analyse[,1][i] <- "WALKING_UPSTAIRS"
      else if(to_analyse[,1][i] == 3) to_analyse[,1][i] <- "WALKING_DOWNSTAIRS"
      else if(to_analyse[,1][i] == 4) to_analyse[,1][i] <- "SITTING"
      else if(to_analyse[,1][i] == 5) to_analyse[,1][i] <- "STANDING"
      else if(to_analyse[,1][i] == 6) to_analyse[,1][i] <- "LAYING"
      
}

## Step 4:

colnames(to_analyse) <- 
      c("Activity", "Subject",
        "tBodyAcc.Mean.X","tBodyAcc.Mean.Y","tBodyAcc.Mean.Z",
        "tBodyAcc.Std.X","tBodyAcc.Std.Y","tBodyAcc.Std.Z",
        "tGravityAcc.Mean.X","tGravityAcc.Mean.Y","tGravityAcc.Mean.Z",
        "tGravityAcc.Std.X","tGravityAcc.Std.Y","tGravityAcc.Std.Z",
        "tBodyAccJerk.Mean.X","tBodyAccJerk.Mean.Y","tBodyAccJerk.Mean.Z",
        "tBodyAccJerk.Std.X","tBodyAccJerk.Std.Y","tBodyAccJerk.Std.Z",
        "tBodyGyro.Mean.X","tBodyGyro.Mean.Y","tBodyGyro.Mean.Z",
        "tBodyGyro.Std.X","tBodyGyro.Std.Y","tBodyGyro.Std.Z",
        "tBodyGyroJerk.Mean.X","tBodyGyroJerk.Mean.Y","tBodyGyroJerk.Mean.Z",
        "tBodyGyroJerk.Std.X","tBodyGyroJerk.Std.Y","tBodyGyroJerk.Std.Z",
        "tBodyAccMag.Mean","tBodyAccMag.Std",
        "tGravityAccMag.Mean","tGravityAccMag.Std",
        "tBodyAccJerkMag.Mean","tBodyAccJerkMag.Std",
        "tBodyGyroMag.Mean","tBodyGyroMag.Std",
        "tBodyGyroJerkMag.Mean","tBodyGyroJerkMag.Std",
        "fBodyAcc.Mean.X","fBodyAcc.Mean.Y","fBodyAcc.Mean.Z",
        "fBodyAcc.Std.X","fBodyAcc.Std.Y","fBodyAcc.Std.Z",
        "fBodyAccJerk.Mean.X","fBodyAccJerk.Mean.Y","fBodyAccJerk.Mean.Z",
        "fBodyAccJerk.Std.X","fBodyAccJerk.Std.Y","fBodyAccJerk.Std.Z",
        "fBodyGyro.Mean.X","fBodyGyro.Mean.Y","fBodyGyro.Mean.Z",
        "fBodyGyro.Std.X","fBodyGyro.Std.Y","fBodyGyro.Std.Z",
        "fBodyAccMag.Mean","fBodyAccMag.Std",
        "fBodyBodyAccJerkMag.Mean","fBodyBodyAccJerkMag.Std",
        "fBodyBodyGyroJerkMag.Mean","fBodyBodyGyroJerkMag.Std")

## Step 5:

ordered_data <- split(to_analyse, list(to_analyse$Activity, to_analyse$Subject))
means <- lapply(ordered_data, function(s) colMeans(s[,3:66]))
write.xlsx(as.data.frame(means), "average.xlsx", sheetName= "average", 
           append= FALSE)

# library("matrixStats")
# sd <- lapply(ordered_data, function(s) colSds(s[,3:66]))
# write.xlsx(as.data.frame(sd), "sd.xlsx", sheetName= "standrad deviation", append= FALSE)