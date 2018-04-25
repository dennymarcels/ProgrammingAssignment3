This script makes use of the dataset available and detailed here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Briefly, it contains data where a group of 30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Each record provides:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Features description:

All names mentiones inside <> do also represent variable names. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals <TimeAcceleration-XYZ> and <TimeGyroscope-XYZ>. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (<TimeBodyAcceleration-XYZ> and <TimeGravityAcceleration-XYZ>) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (<TimeBodyAccelerationJerk-XYZ> and <TimeBodyGyroscopeJerk-XYZ>). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (<TimeBodyAccelerationMagnitude>, <TimeGravityAccelerationMagnitude>, <TimeBodyAccelerationJerkMagnitude>, <TimeBodyGyroscopeMagnitude>, <TimeBodyGyroscopeJerkMagnitude>). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing <FrequencyBodyAcceleration-XYZ>, <FrequencyBodyAccelerationJerk-XYZ>, <FrequencyBodyGyroscope-XYZ>, <FrequencyBodyAccelerationJerkMagnitude>, <FrequencyBodyGyroscopeMagnitude>, <FrequencyBodyGyroscopeJerkMagnitude>. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

This script:

This script merges train and test data, selects mean and std values for the features, relabels activity and features names to improve comprehensibility, and summarizes all remaining variables by mean, grouped by subject and activity. The result is stored in the file summary.txt. Additional information is given in README.md.