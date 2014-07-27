Coursera - Getting and Cleaning Data Final Project

README file
========================================================

This document describes how the Course Project script works.

The objective of the script is to:

i) Merge three files in the Test section, three files in the Training section, and then to append the merged Test and merged Training data to each other.

ii) At various points, column names are given more descriptive names.

iii) One lookup table is used to transform numerical values for the Activity field into a more meaningful description.

iv) Finally, the script creates a tidy data set of the average values for each numerical field, grouped by Activity and Subject.


Here is a step-by-step process of the script:
1)  Set the Working Directory to the location of the saved files.

2)  Download the X_Training and X_Test data.

3)  Download the Column Names from the features.txt file.

4)  Name the columns in the Training and Test data with the names from (3).

5)  Download the Training/Test Activity data, which assigns each observation to its activity type.

6)  Name the Activity column.

7)  Download the Training/Test subject data, which assigns each observation to the subject responsible for producing it.

8)  Download the ActivityLabels data, which is the lookup table for the Activity numerical values.

9)  Name the columns in the ActivityLabels data.

10) Bind (via cbind) the three sets of data (Subjects,Activity,Data) for both the Training and Test observations.

11) Bind (via rbind) the Training and Test Data.

12) Use GREP to locate only the numerical columns we want: those which include STD or MEAN - the latter of which must be followed by () to avoid choosing certain column names which include the word MEAN but are not what we need.

13) Create a new final data set with only the necessary columns.

14) Use MERGE to grab the Activity lookup values and put them in the final data set.

15) Drop an extra, redundant column created by the MERGE.

16) Perform a series of name substitutions to rename the columns in more user-friendly and descriptive terms.

17) Bring in the plyr package

18) Use ddplyr to perform averages over all numerical columns, grouped by Activity and Subject.

19) Write this final, tidy data set to a .csv file.
