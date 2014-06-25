# Code Book 

## Data sets:

feature -- name of features
   .n: integer identifier
   .name: character name

activity_labels -- activity labels
   .id: integer identifier
   .name: character name
   
x_test: test features set
   .561 columns of features (float)
   
x_train: train features set
   .561 columns of features (float)
   
   
y_test: test label set
  . target: integer

y_train: test label set
  . target: integer
  
subject_test -- subjects for test set
  .subject: integer

subject_train -- subjects for train set
  .subject: integer


## Merges the training and the test sets to create one data set
merge features sets only on this stage. resulting set x_com consists on train and test data


## Extracts only the measurements on the mean and standard deviation for each measurement
My approach: if column name contains 'mean' or 'std' - than extruct it if variable n consist on column names then grep("mean", n) gives indexes of columns with "mean" as substring.
So X[,c(grep("mean", n), grep("std", n))] give us what we want.

## Uses descriptive activity names to name the activities in the data set

  .merge all label codes in one dataset
  .create new column with full name
  .add this column to x_com
  
## Appropriately labels the data set with descriptive variable names
since we set col.names parameter during loading datasets - so we already have descriptive variable names


## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
Dataset is tidy couse all colums contain one type of data and named appropriatly.
All rows contain the same sets of data.
Resulting set is stored in tidy.txt and tidy.csv

