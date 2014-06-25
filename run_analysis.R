setwd("/Users/baoj/Documents/R/data/UCI HAR Dataset/")
#test data
x_test = read.table("X_test.txt", header = FALSE, sep = "",
                    col.names = feature$name)
y_test = read.table("y_test.txt", header = FALSE, sep = "",
                    col.names = "label")

#training data
x_train = read.table("X_train.txt", header = FALSE, sep = "",
                     col.names = feature$name)
y_train = read.table("y_train.txt", header = FALSE, sep = "",
                     col.names = "label")

#activity _labels
activity_labels = read.table("activity_labels.txt", header = FALSE, sep = "",
                             col.names = c("id", "name"), stringsAsFactors = F)

#feature 
feature = read.table("features.txt", header = FALSE, sep = "", col.names = 
                       c("n", "name"),stringsAsFactors = F)

#subject
subject_test = read.table("subject_test.txt", header = FALSE, sep = "",
                          col.names = "subject")
subject_train = read.table("subject_train.txt", header = FALSE, sep = "",
                           col.names = "subject")

#combination of test and train for x / y
x_com = rbind(x_train, x_test)
y_com = rbind(y_train, y_test)

#Extracts only the measurements on the mean and 
#standard deviation for each measurement
x_extract = x_com[,grep("mean",names(x_com)), grep("std",names(x_com))]


#Uses descriptive activity names to name the activities in the data set
y_des = merge(x = y_com, y = activity_labels, by.x = "label", by.y = "id",
              all.x = T, all.y = F)
x_com$activity = y_des$name

#Creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject.
x_com$subject = rbind(subject_train, subject_test)$subject
outcome = aggregate(x_com, by = list(activity = x_com$activity, 
                                     subject = x_com$subject),FUN = mean)
write.csv(x = outcome, file = "tidy.csv")



