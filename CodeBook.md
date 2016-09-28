#This document describes the 'Getting and cleaning data' course assignment 

### Source of data
This assignment is based on the data provided at the following location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Acknowledging the work done by: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For more information reference the README.txt contained in the refereced zip folder above.

### run_analysis.R description

Comments are also included within the run_analysis.R file to provide inline runing commentary.

The steps to tidy and summarise the data were as follows

- Download zip file and unzip it to a folder called "/extract"

- Read in the column labels from the "features.txt" file. 
	It was important to read this in first to create a vector of colum names when reading in the data that it relates to.

- Cleanup the label names for Mean, Std Deviation measures.  
	All special characters were removed, however shortened forms 
	e.g. "std" for standard deviation were retained as this created names that were too long and difficult to work with.

- Read in the files for X_train, y_train and X_test, y_test into data frame variables from both the train and test data sets

- Read in the Subject Data for both the train and test data sets

- Combine the various data sets together firstly by columns for the test and train datasets respectively and then append the rows of the resultant datasets together
	Firstly the columns were joined using the cbind function
	Then rbind was used to join the rows
	
- Add a descriptive label to the activity code by adding the activityName to the new combined dataset. 
	This is only done at this point to avoid any potential re-ordering done by the merge statement
	using the dplyr package the combined dataset activity code is merged with the activity code of the labels

- The Mean and Standard Deviation (Std) columns are selected along with the activityName and subject
	All column names containing Mean or Std are found using grep and activityName and subject then added to these
	Using the dplyr select function the subset of columns required is extracted from the combined data set

- A data frame table is created using the dplyr function tbl_df to allow us to use the dplyr summary function on the data set 

- The data is then grouped by the activityName and subject, and the mean calculated for each column in the data for the activityName and subject groupings

- The final tidy summarised data set is written to an output folder as a csv file called "TidyDataSummary.csv".


### Fields within the dataset are as follows

"activityName"                         
"subject"   

- The following fields represent the mean of the measures provided in the original data source for each Activity and Subject.  
	Full column name information can be found with in the "features_info.txt" file within the data zip package referenced above 
	
"timeBodyAccMeanX"                     
"timeBodyAccMeanY"                    
"timeBodyAccMeanZ"                     
"timeBodyAccStdX"                     
"timeBodyAccStdY"                      
"timeBodyAccStdZ"                     
"timeGravityAccMeanX"                  
"timeGravityAccMeanY"                 
"timeGravityAccMeanZ"                  
"timeGravityAccStdX"                  
"timeGravityAccStdY"                   
"timeGravityAccStdZ"                  
"timeBodyAccJerkMeanX"                 
"timeBodyAccJerkMeanY"                
"timeBodyAccJerkMeanZ"                 
"timeBodyAccJerkStdX"                 
"timeBodyAccJerkStdY"                  
"timeBodyAccJerkStdZ"                 
"timeBodyGyroMeanX"                    
"timeBodyGyroMeanY"                   
"timeBodyGyroMeanZ"                    
"timeBodyGyroStdX"                    
"timeBodyGyroStdY"                     
"timeBodyGyroStdZ"                    
"timeBodyGyroJerkMeanX"                
"timeBodyGyroJerkMeanY"               
"timeBodyGyroJerkMeanZ"                
"timeBodyGyroJerkStdX"                
"timeBodyGyroJerkStdY"                 
"timeBodyGyroJerkStdZ"                
"timeBodyAccMagMean"                   
"timeBodyAccMagStd"                   
"timeGravityAccMagMean"                
"timeGravityAccMagStd"                
"timeBodyAccJerkMagMean"               
"timeBodyAccJerkMagStd"               
"timeBodyGyroMagMean"                  
"timeBodyGyroMagStd"                  
"timeBodyGyroJerkMagMean"              
"timeBodyGyroJerkMagStd"              
"frequencyBodyAccMeanX"                
"frequencyBodyAccMeanY"               
"frequencyBodyAccMeanZ"                
"frequencyBodyAccStdX"                
"frequencyBodyAccStdY"                 
"frequencyBodyAccStdZ"                
"frequencyBodyAccMeanFreqX"            
"frequencyBodyAccMeanFreqY"           
"frequencyBodyAccMeanFreqZ"            
"frequencyBodyAccJerkMeanX"           
"frequencyBodyAccJerkMeanY"            
"frequencyBodyAccJerkMeanZ"           
"frequencyBodyAccJerkStdX"             
"frequencyBodyAccJerkStdY"            
"frequencyBodyAccJerkStdZ"             
"frequencyBodyAccJerkMeanFreqX"       
"frequencyBodyAccJerkMeanFreqY"        
"frequencyBodyAccJerkMeanFreqZ"       
"frequencyBodyGyroMeanX"               
"frequencyBodyGyroMeanY"              
"frequencyBodyGyroMeanZ"               
"frequencyBodyGyroStdX"               
"frequencyBodyGyroStdY"                
"frequencyBodyGyroStdZ"               
"frequencyBodyGyroMeanFreqX"           
"frequencyBodyGyroMeanFreqY"          
"frequencyBodyGyroMeanFreqZ"           
"frequencyBodyAccMagMean"             
"frequencyBodyAccMagStd"               
"frequencyBodyAccMagMeanFreq"         
"frequencyBodyBodyAccJerkMagMean"      
"frequencyBodyBodyAccJerkMagStd"      
"frequencyBodyBodyAccJerkMagMeanFreq"  
"frequencyBodyBodyGyroMagMean"        
"frequencyBodyBodyGyroMagStd"          
"frequencyBodyBodyGyroMagMeanFreq"    
"frequencyBodyBodyGyroJerkMagMean"     
"frequencyBodyBodyGyroJerkMagStd"     
"frequencyBodyBodyGyroJerkMagMeanFreq" 
"angletBodyAccMeangravity"            
"angletBodyAccJerkMeangravityMean"     
"angletBodyGyroMeangravityMean"       
"angletBodyGyroJerkMeangravityMean"    
"angleXgravityMean"                   
"angleYgravityMean"                    
"angleZgravityMean"