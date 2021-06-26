import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# Data Preprocessing
dataset = pd.read_csv('Salary_Data.csv')
# Independant Variable (features)
x = dataset.iloc[:,:-1].values # all rows, all columns but last
# Dependant Variable  (labels)
y = dataset.iloc[:, -1].values # all rows, last column
# split training and test data
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state = 0)

# create the linear regression model
regressor = LinearRegression()

# Train model
regressor.fit(x_train, y_train) # fit is the "train" method

# Make a prediction using the model
y_test_pred = regressor.predict(x_test)
y_train_pred = regressor.predict(x_train)

# Visualize training set
plt.scatter(x_train, y_train, color = "red") # plots points
plt.plot(x_train, y_train_pred, color="blue") # plots curves
plt.title('Salary vs Experience (Training)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()

# Visualize test set
plt.scatter(x_test, y_test, color = "red")
plt.plot(x_train, y_train_pred, color="blue") # same as above
plt.title('Salary vs Experience (Test)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()
