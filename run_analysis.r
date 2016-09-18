run_analysis<-function() {
  X_train<-read.table("train/X_train.txt")
  y_train<-read.table("train/y_train.txt")
  subject_train<-read.table("train/subject_train.txt")
  
  X_test<-read.table("test/X_test.txt")
  y_test<-read.table("test/y_test.txt")
  subject_test<-read.table("test/subject_test.txt")
  
  full_train<-cbind(subject_train,y_train,X_train)
  full_test<-cbind(subject_test,y_test,X_test)

  
  full_set<-rbind(full_train,full_test)
  full_set
  
  #install.packages("plyr")
  #library(plyr)
  
  full_set[,2]<-mapvalues(as.numeric(full_set[,2]),c(1,2,3,4,5,6),c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting","Standing","Laying"))
  means<-rowMeans(full_set[,3:563])
  sdevs<-rowSds(as.matrix(full_set[,3:563]))
  
  final_set<-cbind(full_set[,1:2],means,sdevs)
  colnames(final_set)<-c("Subject","Activity","Avg of Means","Avg of SDevs")
  ddply(final_set,.(Subject,Activity),summarize,mean=mean(Mean),sd=mean(SDev))
}