library(caTools)

# Pre-process Data
dataset = read.csv('Data.csv')
#dataset = dataset[, 2:3]

# Split into Test & Training Sets
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# runs on all rows and on columns 2 - 3
training_set[,2:3] = scale(training_set)
test_set[,2:3] = scale(test_set)