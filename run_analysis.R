
# =====================================
# Read in the feature & activity names.
# =====================================

# Read in the column names (aka, feature names).
features <- read.table("features.txt")

# Feature names are in the 2nd column of the data we just read.
features <- features$V2

# Read in the lookup data for the activies.  This lookup table
# will be used to replace the activity codes in the y_ files
# with descriptive names.
labels <- read.table("activity_labels.txt")

# Label the column names in the activity lookup table.
names(labels) <- c("activity_code", "activity")

# =====================================
# Read in the training data set.
# =====================================

# The 7352 observations of 561 variables.
X_train <- read.table("train/X_train.txt")

# The activity codes for our 7352 observations.
y_train <- read.table("train/y_train.txt")

# The subject numbers (IDs) for our 7352 observations.
subject_train <- read.table("train/subject_train.txt")

# =====================================
# Read in the test data set.
# =====================================

# The 2947 observations of our 561 variables.
X_test <- read.table("test/X_test.txt")

# The activity codes for our 2947 observations.
y_test <- read.table("test/y_test.txt")

# The subject numbers (IDs) for our 2947 observations.
subject_test <- read.table("test/subject_test.txt")

# =======================================
# Combine the testing and training data.
# =======================================
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# =======================================
# Label the columns in our dataframes.
# =======================================

# Label the combined observations with the feature names.
colnames(X_data) <- features

# Label the subject and activity_code columns.
colnames(subject_data) <- "subject"
colnames(y_data) <- "activity_code"

# =======================================
# Use the activity lookup table to create a vector
# of activity names from the activity code column.
# =======================================
activity <- as.character(labels[match(y_data$activity_code, labels$activity_code), "activity"])

# =======================================
# Select from our observations only the mean
# and std variables.
# =======================================
selected_data <- X_data[,grepl("mean\\(\\)|std\\(\\)", colnames(X_data))]

# =======================================
# Combine the subject IDs, the activity names, and the
# mean & std observations together.  This is our first
# "tidy" data set, used to create the uploaded .txt file.
# =======================================
data <- cbind(subject_data, activity, selected_data)

# =======================================
# For each subject-activity pair, compute the mean of
# each observation.  This is our second tidy data set.
# =======================================
means_by_subject_and_activity = aggregate( .~ subject + activity, data=data, FUN=mean )

# =======================================
# Output the final data set.
# =======================================
print(means_by_subject_and_activity)
