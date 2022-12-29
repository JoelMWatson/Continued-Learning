import numpy as np # Mathematics on Arrays/Matrices
import matplotlib.pyplot as plt # graph visualization
import pandas as pd # data analysis and manipulation
from sklearn.impute import SimpleImputer # completing missing values
from sklearn.compose import ColumnTransformer # transformers to columns of an array or pandas DataFrame
from sklearn.preprocessing import OneHotEncoder # Encode categorical features as a one-hot numeric array.
from sklearn.preprocessing import LabelEncoder # Encode target labels with value between 0 and n_classes-1.
from sklearn.model_selection import train_test_split # Split arrays or matrices into random train and test subsets
from sklearn.preprocessing import StandardScaler # removes the mean and scales the data to unit variance

# bring in csv dataset
data = pd.read_csv('Data.csv')
x = data.iloc[:, :-1].values
y = data.iloc[:, -1].values

# handle missing data
imputer = SimpleImputer(missing_values=np.nan, strategy='mean')
x[:, 1:3] = imputer.fit_transform(x[:, 1:3])

# encode the independent variables
ct = ColumnTransformer(transformers=[('encoder', OneHotEncoder(), [0])], remainder='passthrough')
x = np.array(ct.fit_transform(x))

# encode the dependent variables
le = LabelEncoder()
y = le.fit_transform(y)

# split dataset into training and test
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)

# feature scaling
sc = StandardScaler()
x_train[:, 3:] = sc.fit_transform(x_train[:, 3:])
x_test[:, 3:] = sc.transform(x_test[:, 3:])