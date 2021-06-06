library(caTools)
library(ggplot2)

# Pre-process Data
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

# Split into Test & Training Sets
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# runs on all rows and on columns 2 - 3
#training_set[,2:3] = scale(training_set)
#test_set[,2:3] = scale(test_set)

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

y_test_pred = predict(regressor, newdata = test_set)
y_train_pred = predict(regressor, newdata = training_set)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = y_train_pred),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training)') +
  xlab('Years of Experience') +
  ylab('Salary')

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = y_train_pred),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training)') +
  xlab('Years of Experience') +
  ylab('Salary')


