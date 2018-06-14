# Cleaning-data-project
The accompanying script works as follows:

  a. The script first reads the variable names from the given 'features.txt' file for use later.
  
  b. All the test data is read from the given 'subject_test.txt', 'y_test.txt' and 'X_test.txt' files. These data are then combined in a single database labelled 'testds' whose first two columns are labelled 'subject id' and 'activity id'. The other columns are labelled using the variable names stored in part a.
  
  c. Step b is repeated for the train data.
  
  d. The test and train data are then merged into a single database called 'merged.data'.
  
  e. The activity id column originally had numerical representations for the activities but these are changed into more meaningful text descriptions.
  
  f. The 'merged.data' database is then culled to include only those columns with mean and std dev values.
  
  g. The means of each variable for each activity and each subject are calculated for the reduced database.
  
  h. Finally these means are output into the file 'tidy_ds.txt'.
  
  
