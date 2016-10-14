# Getting and Cleaning Data
# Final Project: Wearables Analysis
#Code Book

##Transformations
The script does the following:
1. Merge Train and Test data sets
2. Assign column names - Subject, Activity, and then the variable names as described in the features.txt file
3. Extract only the Subject, Activity, Mean and Standard deviation variables
4. Group by Subject and Activity, and calculate the average for each variable in these groupings


##Variables
* Subject: The ID number of the subject being monitored, from 1 to 30
* Activity: The name of the activity being monitored - Laying, Sitting, Standing, Walking, Walking_Downstairs, Walking_Upstairs
* Following the Subject and Activity variables are 77 variables. These are the means and standard deviations of each parameter, averaged together by subject and activity.

##Notes
The averaging out of the standard deviations isn't statistically correct. I was just following the somewhat ambiguous prompt. The accurate approach would be to calculate the weighted average of the variances and then square root this to get the standard deviation.
