# README file for Data Cleaning Project

##Data Generation
The data was generated using the script contained at run_analysis.R.  See comments in the file.

A summary of the process is presented here.

1. The data was obtained from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and placed in the "data" directory.
2. Since the data came in two data sets (TRAIN TEST), the following steps were performed for each set (TRAIN and TEST):
  i) load the data to a working dataset
  ii) load and add the subject information to the working dataset
  iii) load and add the ACTIVITY information to the working dataset
3. Combine the TEST and TRAIN datasets
4. Identify the columns that contain MEAN data (identified by the string "mean()" contained in the column name)
5. Identify the columns that contain STANDARD DEVISION data (identified by the string "std()" in the column name)
6. Extract the MEAN and STD columns
7. Load and add the descriptive labels for the activities
8. Using the data set from step 7, change from a wide to a narrow data table and produce summary data grouped by subject and activity, showing the mean of the columns extracted in step 6 above.
9. Output the final data ("analysis.data.csv")
