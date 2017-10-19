
  require(dplyr)
  require(reshape2)
  rm(list=ls())
  
  ## build the X_TRAIN table
  x_train <- read.table("data/train/X_train.txt")
  x_train<-tbl_df(x_train)
  x_labels <- read.table("data/features.txt")
  names(x_train) <- x_labels$V2
  
  ## add the subject
  x_sub <- read.table("data/train/subject_train.txt")
  x_train["subject"]<-x_sub$V1
  
  ## add the activity
  y_train<-read.table("data/train/y_train.txt")
  x_train["activity"] <- y_train$V1
  
  ## build the X_TEST table
  x_test <- read.table("data/test/X_test.txt")
  x_test<-tbl_df(x_test)
  x_labels <- read.table("data/features.txt")
  names(x_test) <- x_labels$V2

  ##add the subject
  x_sub <- read.table("data/test/subject_test.txt")
  x_test["subject"]<-x_sub$V1
  
  ##add the activitys
  y_test<-read.table("data/test/y_test.txt")
  x_test["activity"] <- y_test$V1
  
  
  ##combine TEST and TRAIN into one table
  x_all <-rbind(x_train,x_test)
  x_all <- tbl_df(x_all)
  
  ##find MEAN columns
  meanCols <- grep("mean()",names(x_all))
  ##find STD columns
  stdCols <- grep("std()",names(x_all))
  
  ##extract the MEAN and STD columns 
  output.data <- select(x_all,names(x_all[,meanCols]),names(x_all[,stdCols]),subject,activity)
  output.data <- tbl_df(output.data)
  
  ## Add Activity Labels
  al <- read.table("data/activity_labels.txt")
  output.data <- mutate(output.data,AD=al$V2[activity])
  
  ##output.data is the tidy data set containing the original data
  
  ##generate the analysis data that is summarized for each mean & standard deviation measurement.
  analysis.data <- melt(output.data,id=c("subject","activity","AD"))
  analysis.data <- group_by(analysis.data,subject,activity,AD,variable) %>% summarise(VarAverage=mean(value))
  
  write.table(analysis.data,row.names=FALSE,file="analysis.data.csv",append=FALSE,sep=",")
  
  ##analysis.data is the output data described by associated code book
  analysis.data
  
  