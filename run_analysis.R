
######### Step 1 #################### Start #
######### Downloading and Unzip #############
# Set the working directory to Course 3 project directory 
setwd("C:/Users/hsrirama/Documents/Personal/Coursera/Course 3 - Cleansing Data/Project")

# Set a variable for the 'download' file name
fname = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Set a variable for downloaded destination file name
zfname="C3W4assgnmt.zip"

# Check if the file to be downloaded already exists and then download
if (!file.exists(zfname)) {download.file(fname, destfile = zfname)}

# Check if the data directory where you want to unzip the Zip file already exists. If not, create it under current directory
if (!file.exists("./data")) {dir.create("./data")}

# Unzip the file to 'data' directory
unzip(zfname, exdir = "./data")

# Check if the unzipped folder exists
if (!file.exists("./data/UCI HAR Dataset")) { stop("Required dataset doesn't exists. Download and extract data.") }

# Change directory to unzipped folder
setwd("./data/UCI HAR Dataset")

######### Step 1 #################### End #

######### Step 2 #################### Start #############
######### Merging training and testing data to 1 data set

# Get the 'test' folder files names
#testfiles = list.files(path= "./test/Inertial Signals", pattern = "*.txt")

# Get the 'train' folder files names
#trainfiles = list.files(path= "./train/Inertial Signals", pattern = "*.txt")

# First apply read.table, then rbind
#myTRfiles = do.call(rbind, lapply(trainfiles, function(x) {y=paste("./train/Inertial Signals/", x, sep=""); read.table(y, sep = "")}))

# First apply read.table, then rbind
#myTSfiles = do.call(rbind, lapply(testfiles, function(x) {y=paste("./test/Inertial Signals/", x, sep=""); read.table(y, sep = "")}))

# Create a consolidated Data Frame
#consolFile <- rbind (myTRfiles, myTSfiles)

# Read other label files
#cname <- read.table("./features.txt", sep="")
#cname2 <- list(cname[,2])
features2 <- list(read.table("./features.txt", sep="")[,2])
features <- data.frame(lapply(lapply(features2, gsub, pattern = "\\(", replacement = ""),gsub, pattern ="\\)", replacement =""))

activity_labels <- read.table("./activity_labels.txt", sep="")

colnames(activity_labels) <- c("ActivityNo", "ActivityName")

# Read Training data & along with other files from "train" directory
X_train <- read.table("./train/X_train.txt", sep="")
Y_train <- read.table("./train/y_train.txt", sep="")
subject_train <- read.table("./train/subject_train.txt", sep="")

colnames(Y_train) <- "ActivityNo"
colnames(subject_train) <- "SubjectID"
colnames(X_train) <- unlist(features[,1])

# Read Testing data from "test" directory
X_test <- read.table("./test/X_test.txt", sep="")
Y_test <- read.table("./test/y_test.txt", sep="")
subject_test <- read.table("./test/subject_test.txt", sep="")

colnames(Y_test) <- "ActivityNo"
colnames(subject_test) <- "SubjectID"
colnames(X_test) <- unlist(features[,1])

######### Merging training dataset and testing dataset as individual datasets

# Consolidate Training
XC_train <- cbind(Y_train, subject_train, X_train)

# Consolidate Testing
XC_test <- cbind(Y_test, subject_test, X_test)

# Consolidate both the data into one data set
consolFile <- rbind (XC_train, XC_test)

######### Step 2 #################### End #################################

######### Step 3 #################### Start ####################################
######### Extract only the measurements on the mean and SD for each measurements

cname <- colnames(consolFile)
selectCols <- grepl("[Mm]ean|Activity|SubjectID|[Ss]td",cname)

selectRows <- consolFile[,selectCols == TRUE]

######### Step 3 #################### End #################################


######### Step 4 #################### Start ####################################

selectRows_w_ActyNm <- merge(x = activity_labels, y = selectRows, by = "ActivityNo", all.y = TRUE)

######### Step 4 #################### End ####################################

aggResult <- aggregate(selectRows_w_ActyNm[,4:89], selectRows_w_ActyNm[1:3], mean)
aggResult <- aggResult[order(aggResult$SubjectID, aggResult$ActivityNo),] 

write.table(aggResult, "aggResult.txt", row.names = FALSE)

