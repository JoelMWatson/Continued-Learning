import numpy as np # Mathematics on Arrays/Matrices
import matplotlib.pyplot as plt # graph visualization
import pandas as pd # data analysis and manipulation
from sklearn.model_selection import train_test_split # Split arrays or matrices into random train and test subsets
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.linear_model import LinearRegression

# bring in csv dataset
data = pd.read_csv('50_Startups.csv')
x = data.iloc[:, :-1].values
y = data.iloc[:, -1].values

# encode categories
ct = ColumnTransformer(transformers=[('encoder', OneHotEncoder(), [3])], remainder='passthrough')
x = np.array(ct.fit_transform(x))

# split dataset into training and test
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)

# train the model on the training set
regressor = LinearRegression()
regressor.fit(x_train, y_train)

# predict the test results
y_pred = regressor.predict(x_test)

# print to visualize in 2 columns [prediction, real_value]
np.set_printoptions(precision=2)
print(np.concatenate((y_pred.reshape(len(y_pred), 1), y_test.reshape(len(y_pred), 1)), 1))
