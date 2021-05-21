# -*- coding: utf-8 -*-

import numpy as np # handles math for data
import matplotlib.pyplot as plt # plots the data
import pandas as pd # imports data
from sklearn.impute import SimpleImputer # Handle empty values in dataset
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScalar

dataset = pd.read_csv('Data.csv')
# Independant Variable (features)
x = dataset.iloc[:,:-1].values # all rows, all columns but last

# : is short hand for the whole range 
# :-1 is short for the range 0 all -1

# Dependant Variable  (labels)
y = dataset.iloc[:, -1].values # all rows, last column

# create imputer to search for NaN and replace with avg
imputer = SimpleImputer(missing_values=np.nan, strategy='mean') 
# connect imputer to the features rows and columns
imputer.fit(x[:,1:3]) 
# return the new matrix with missing data filled in 
x[:,1:3] = imputer.transform(x[:,1:3])

# Handling Categorical Data

# Features - (country, age, salary)
# One Hot Encoding
# transforms column[0] with the encoder transformer OneHotEncoder(). 
# Passes through to return all columns created
ct = ColumnTransformer(transformers=[('encoder', OneHotEncoder(), [0])], remainder="passthrough")

# Run transformer on matrix
x = np.array(ct.fit_transform(x))

# Labels - (purchased)
le = LabelEncoder()
y = le.fit_transform(y)

# split training and test data
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2)

# Feature Scaling
sc = StandardScalar()

# transform only numerical columns
x_train[:,3:] = sc.fit_transform(x_train[:,3:]) # all rows and columns 3+
x_test[:,3:] = sc.fit_transform(x_test[:,3:]) # all rows and columns 3+

