# The Data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`. These time domain signals (prefix `t` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag`. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
`-XYZ` is used to denote 3-axial signals in the X, Y and Z directions.

* `tBodyAcc-XYZ`
* `tGravityAcc-XYZ`
* `tBodyAccJerk-XYZ`
* `tBodyGyro-XYZ`
* `tBodyGyroJerk-XYZ`
* `tBodyAccMag`
* `tGravityAccMag`
* `tBodyAccJerkMag`
* `tBodyGyroMag`
* `tBodyGyroJerkMag`
* `fBodyAcc-XYZ`
* `fBodyAccJerk-XYZ`
* `fBodyGyro-XYZ`
* `fBodyAccMag`
* `fBodyAccJerkMag`
* `fBodyGyroMag`
* `fBodyGyroJerkMag`

The set of variables that were estimated from these signals are:

* `mean()`: Mean value
* `std()`: Standard deviation

In total, we have 66 variables: a mean and a std for 8 different XYZ variables, and a mean and std for another 9 magnitude variables. `((2 * 8 * 3) + 2 * 9)  = 66`

The `subject` column gives the subject ID for each of 24 subjects.  The `activity` column gives the activity each subject was performing when the observations where carried out.

# It's Production

An intermediate tidy data set was produced from a larger initial dataset.  This larger initial dataset included additional statictics for each variable.  These additional statistics were discarded, to leave use with just the `mean` and `std` statistics.  The initial dataset was also divided into test and training data.  Here we have combined the test and training data into one combined dataset.

The final dataset, which is output by the `run_analysis.R` script produces, a mean value for each variable, grouped by subject and activity, giving us finally an single mean value, for each variable, for each subject-activity pair.

