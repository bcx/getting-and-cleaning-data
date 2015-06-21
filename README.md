# getting-and-cleaning-data

Class project for Coursera "Getting and Cleaning Data" class.

This repository contains a pair of files.

One is `run_analysis.R`.  This script can be run against the original dataset, found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Your working directory, when you run the `run_analysis.R` should be the unzipped original dataset.

The `run_analysis.R` script creates a simpler intermediate data set from the original dataset.  This intermediate dataset discards some of the variable statistics, leaving only the mean and standard deviation values for each of 33 variables.

It contains 10299 observations in total, as it combines the test data and training data from the original dataset.  

It is *tidy* in the sense that it glues together into a single dataframe data which the orginal dataset has split across serveral files.  It also replaces the activity codes from the original data set with human-friendly labels.

Finally, the `run_analysis.R` script applies an `aggregation` operation to the intermediate data, to produce it's output.  This output gives a single mean for each each of the 66 variables, across 180 observations.  The observations in this final table are aggregated by subject and activity.  (Multiple observations for each subject for each activity are combined into one.)  We end up with 180 rows: 6 activies for each of 30 subjects.

Also included is a codebook (`CodeBook.md`) which describes the variables and their method of collection in more detail.
