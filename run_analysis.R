# Read in the variable names
vname <- read.table("features.txt",header=FALSE)
vname$V1 <- NULL

# Read in the test data, combine them and name the columns
sid <- read.table("subject_test.txt",header = FALSE)
aid <- read.table("y_test.txt",header = FALSE)
testd <- read.table("X_test.txt",header = FALSE)
testds <- cbind(sid,aid,testd)
colnames(testds) <- c("subject id","activity id")
for (i in 1:561) {names(testds)[i+2]=as.character(vname[i,])}

# Read in the train data, combine them and name the columns
sid2 <- read.table("subject_train.txt",header = FALSE)
aid2 <- read.table("y_train.txt",header = FALSE)
traind <- read.table("X_train.txt",header = FALSE)
trainds <- cbind(sid2,aid2,traind)
colnames(trainds) <- c("subject id","activity id")
for (i in 1:561) {names(trainds)[i+2]=as.character(vname[i,])}

#Merge the two data sets
merged.data <- rbind(testds,trainds)

#Change actvitiy ids to labels
swap_vec <- c("1"="WALKING", 
              "2" = "WALKING_UPSTAIRS",
              "3"="WALKING-DOWNSTAIRS",
              "4"= "SITTING",
              "5"="STANDING",
              "6"="LAYING")
merged.data$'activity id'<- swap_vec[merged.data$'activity id']

#select only the columns with mean and std dev values
msdds <- merged.data[,grep("subject|activity|\\bmean()\\b|\\bstd()\\b", colnames(merged.data))]


# Calculate the means of of each variable for each activity and each subject.
install.packages("dplyr")
library(dplyr)
tidy_ds <- msdds %>% group_by(`subject id`,`activity id`) %>% summarise_all(funs(mean)) 

# Output the tidy data set to a file
write.table(tidy_ds, "tidy_ds.txt", row.name=F)
                                                             