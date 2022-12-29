import numpy as np # Mathematics on Arrays/Matrices
import matplotlib.pyplot as plt # graph visualization
import pandas as pd # data analysis and manipulation
from sklearn.model_selection import train_test_split # Split arrays or matrices into random train and test subsets
from sklearn.linear_model import LinearRegression

# bring in csv dataset
data = pd.read_csv('Salary_Data.csv')
x = data.iloc[:, :-1].values
y = data.iloc[:, -1].values

# split dataset into training and test
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)

# train the model on the training set
regressor = LinearRegression()
regressor.fit(x_train, y_train)

# predict the test results
y_pred = regressor.predict(x_test)

# visualize the training results
plt.scatter(x_train, y_train, color = "red")
plt.plot(x_train, regressor.predict(x_train), color = "blue")
plt.title("Salary vs Experience (training set)")
plt.xlabel("Years of experience")
plt.ylabel("Salary")
plt.show()

# visualize the test results
plt.scatter(x_test, y_test, color = "red")
plt.plot(x_train, regressor.predict(x_train), color = "blue")
plt.title("Salary vs Experience (training set)")
plt.xlabel("Years of experience")
plt.ylabel("Salary")
plt.show()