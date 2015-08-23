# README.md
========================================================

==================================================================
Human Activity Recognition Using Smartphones Dataset Analysis
==================================================================

This repo consists of 3 files
<br>

<ol type=number><i>
<li> README.md </li>
<li> run_analysis.R </li>
<li> Cookbook.md </li></i>
</ol>

### README.md <br>
This file describes how the scripts work and descriptions of the files in the repo.<br>

### run_analysis.R
This file contains a script that performs the analysis on the given data set.
<br><br>
<b> Step 1: </b>

Reads the data from test and training data from "UCI HAR DATASET" and merges them to a single data set and sets their respective column names as provided in the <i>features.txt</i> file and exports the merged tidy data to a file <i> tidydata.txt </i> in which the columns are seperated with delimiter as tabspace(\t).<br>This tidy data set has 10299 observations of 563 variables.

<b> Step 2: </b>

Since the tidy data has a lots of data, we are extracting the required columns related to mean and standrad deviation for each measurment.<br><br>

<b> Step 3: </b>

The activity labels(1 to 6) refer to different activities. Here we are replacing the activity values with their corresponding name as mentioned in the <i> activity_labels.txt</i>.

<b> Step 4: </b>

Renaming the column names of the subsetted data with a convienient way of identifying. The description of each is provided in the <i>Cookbook.md</i> file on the repo.

<b> Step 5: </b>

Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data set was exported to <i>average.xlsx</i> which has 64 rows and 180 columns. The rows in the dataset repesent variables and the columns represent activities and subjects in format `<ACTIVITY_NAME>.<SUBJECT_NUMBER>` where ACTIVITY_NAME is one of the 6 in {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING} and SUBJECT_NUMBER varies from 1 to 30
<br>

### Cookbook.md

This file describes all the variables, data, naming conventions for the extracted data in step 4 and the respective steps performed on the data.
