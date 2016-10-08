run_analysis<-function() {
  #Read in Training subject, activity, and data
  X_train<-read.table("train/X_train.txt")
  y_train<-read.table("train/y_train.txt")
  subject_train<-read.table("train/subject_train.txt")
  
  #read in Test subject, activity, and data
  X_test<-read.table("test/X_test.txt")
  y_test<-read.table("test/y_test.txt")
  subject_test<-read.table("test/subject_test.txt")
  
  #Merge Train and Test columns (subject, actiivty, data)
  full_train<-cbind(subject_train,y_train,X_train)
  full_test<-cbind(subject_test,y_test,X_test)

  #Merge together the Train and Test data sets
  full_set<-rbind(full_train,full_test)
  
  #Assign all column names, including those pulled in from features.txt
  features<-read.table("features.txt")
  colnames(full_set)<-c("Subject","Activity",as.vector(features[1:561,2]))
  full_set
  
  #Extract column numbers of only the subject, activity, mean and std variables
  features_extract<-grep(paste(c("Subject","Activity","mean","std"),collapse="|"),colnames(full_set))
  new_full_set<-full_set[,features_extract]
  new_full_set
  
  #Map activity values
  new_full_set[,2]<-mapvalues(as.numeric(full_set[,2]),c(1,2,3,4,5,6),c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting","Standing","Laying"))
  new_full_set
  
  #Group by activity and find mean per group
  final_result<-aggregate(new_full_set[,3:79],list(Subject=new_full_set$Subject,Activity=new_full_set$Activity),mean)
  final_result
}
