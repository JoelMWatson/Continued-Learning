# -*- coding: utf-8 -*-

# Import Libraries
import numpy as np # handles math for data
import matplotlib.pyplot as plt # plots the data
import pandas as pd # imports data
from sklearn.model_selection import train_test_split

# Data Preprocessing
dataset = pd.read_csv('Data.csv')
# Independant Variable (features)
x = dataset.iloc[:,:-1].values # all rows, all columns but last
# Dependant Variable  (labels)
y = dataset.iloc[:, -1].values # all rows, last column
# split training and test data
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state = 0)