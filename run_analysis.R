#========================================================================================================================
# 1. Merges the training and the test sets to create one data set.

# 1.1 Load training dataset
#The absolute path of the data directory
dir_path <- "getdata_projectfiles_UCI HAR Dataset/"

x_train<-read.table(paste(dir_path, "train/X_train.txt", sep = ""),
                    header = FALSE)
y_train<-read.table(paste(dir_path, "train/y_train.txt", sep = ""),
                    header = FALSE)

#Get activities from training labels data
train<-cbind(x_train, activities = y_train$V1)

# 1.2 Load test dataset
x_test<-read.table(paste(dir_path, "test/X_test.txt", sep = ""),
                   header = FALSE)
y_test<-read.table(paste(dir_path, "test/y_test.txt", sep = ""),
                   header = FALSE)

#Get activities from test labels data
test<-cbind(x_test, activities = y_test$V1)

# 1.3 Merge training and test data set
smrt_phne_dataset<-rbind(train, test)
#Delete temporary vectors
rm("x_train", "y_train", "x_test", "y_test", "train", "test")

#========================================================================================================================
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# 2.1 Using the features.txt, get the column names for every variable in data set
features<-read.table(paste(dir_path, "/features.txt", sep = ""),
                     header = FALSE)

# 2.2 Get the column names which have mean or std in it.
col_names<-features$V1[grep("(mean\\(\\))|std\\(\\)", features$V2)]

# 2.3 Subset the data based on the mean and standard deviation for each measurement.
measured_values<-smrt_phne_dataset[c(sapply(col_names, function(x){paste("V", x, sep = "")}), "activities")]
#========================================================================================================================
# 3. Uses descriptive activity names to name the activities in the data set

# 3.1 Load the activity_labels.txt which has the descriptive activity names for each activity
activity_labels<-read.table(paste(dir_path, "/activity_labels.txt", sep = ""),
                            header = FALSE)

# 3.2 Update activities with values from activity_labels to the main dataset
measured_values$activities<-sapply(measured_values$activities, 
                                   function(x){activity_labels$V2[activity_labels$V1==x]})
#========================================================================================================================
# 4. Appropriately labels the data set with descriptive variable names. 

# 4.1 Get the descriptive names using the features data frame
library(dplyr)
measure_features<-features[features$V1 %in% col_names,]

# 4.2 Helper function to clean the variable name to appropriate format
name_clean<-function(x) {
  x<-as.character(x)
  temp_list<-strsplit(x, "\\-")
  var_name<-tolower(temp_list[[1]][1])
  if (lengths(temp_list)>1){
    
    method<-substr(tolower(temp_list[[1]][2]),1, nchar(temp_list[[1]][2])-2)
    var_name<-paste(var_name, method, sep = "_")
  }
  
  if (lengths(temp_list)>2){
    
    var_name<-paste(var_name, tolower(temp_list[[1]][3]), sep = "_")
  }
  var_name
}

# 4.3 Update the column names for measured_values data frame.
library(readr)
iter<-0
detail_names<-c()
for (element in colnames(measured_values)[1:(length(colnames(measured_values)) -1)]) {
  ele_no<-parse_number(as.character(element))
  iter<- iter + 1
  if (ele_no %in% as.numeric(measure_features$V1)) {
    
    variable_name<-name_clean(measure_features$V2[iter])
    detail_names<-append(detail_names, variable_name, after = length(detail_names))
    
  } else {print(ele_no)}

}
names(measured_values)[1:length(measured_values)-1] <- detail_names

#Delete temporary vectors
rm("iter", "detail_names", "ele_no", "element", "variable_name", "col_names", "measure_features")
#========================================================================================================================
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.

# 5.1 Load subject data
sub_train<-read.table(paste(dir_path, "train/subject_train.txt", sep = ""),
                      header = FALSE)
sub_test<-read.table(paste(dir_path, "test/subject_test.txt", sep = ""),
                    header = FALSE)
subjects<-rbind(sub_train, sub_test)

# 5.2 Include subjects in the measured_values data frame
measured_values<-cbind(measured_values, subjects = subjects$V1)

# 5.3 Get the column_names for every measure variables
measure_var_names<-names(measured_values)[1:(ncol(measured_values)-2)]

# 5.3 Create a new data set with the averages of each variable for each activity and each subject.
measured_averages<-measured_values %>%
  group_by(activities, subjects) %>%
  summarize_at(measure_var_names, funs(mean(., na.rm = TRUE)))

#Delete temporary vectors
rm("sub_train", "sub_test", "subjects", "measure_var_names", "dir_path")

View(measured_averages)
#========================================================================================================================