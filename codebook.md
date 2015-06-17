This project uses the packages RCurl, dplyr

fileUrl is the URL for the file to download from

activityfilename contains the filename for the activities file
activities is the data frame containing the activities file
activities2 stores activities as factors

propfilename is the filename containing the column headings of the 561 features vector
propertylabels contains the features names
propertylabels2 contains only the names and not the row numbers
propertylabels3 contains only the mean() and std() variables
propertylabels4 contains the subject, activity and the other 561 variable labels

testsubjectfilename contains the filename of hte test subjects
testsubject contains the test subjects ids
testxfilename contains the filename of the observations of the subjects 
testx contains the observations for all 561 variables
testyfilename contains the filename of the activity of test subjects
testy contains the activity of the test subjects

trainsubjectfilename contains the filename of hte train subjects
trainsubject contains the train subjects ids
trainxfilename contains the filename of the observations of the subjects 
trainx contains the observations for all 561 variables
trainyfilename contains the filename of the activity of train subjects
trainy contains the activity of the train subjects

tests2 column binds the testsubject, activity, and the variables of std() and mean() only with proper column names

train2 column binds the train subject, activity and the variables of std() and mean() only with proper column names

final_data_set row binds the test and train data 

final_summary then aggregates the final_data_set by subject and activity to calculate the mean

final_summary2 contains only the required columns for output with proper labeling the activity





