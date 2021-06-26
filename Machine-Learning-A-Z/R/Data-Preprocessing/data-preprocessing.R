library(caTools)

# Load Data
dataset = read.csv('Data.csv')

# Fix Missing Data
dataset$Age = ifelse(is.na(dataset$Age), 
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), 
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), 
                     dataset$Salary)

# Encode Categorical Data
dataset$Country = factor(dataset$Country,
                         levels = c('France','Spain','Germany'),
                         labels = c(1,2,3))

#dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No','Yes'),
                         labels = c(0,1))

# Split into Test & Training Sets
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature Scaling

# runs on all rows and on columns 2 and 3
training_set[,2:3] = scale(training_set)
test_set[,2:3] = scale(test_set)



