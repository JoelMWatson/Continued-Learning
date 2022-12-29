import numpy as np # Mathematics on Arrays/Matrices
import matplotlib.pyplot as plt # graph visualization
import pandas as pd # data analysis and manipulation
from sklearn.model_selection import train_test_split # Split arrays or matrices into random train and test subsets

# bring in csv dataset
data = pd.read_csv('50_Startups.csv')
x = data.iloc[:, :-1].values
y = data.iloc[:, -1].values



# split dataset into training and test
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)

# train the model on the training set

# predict the test results

# visualize the training results

# visualize the test results