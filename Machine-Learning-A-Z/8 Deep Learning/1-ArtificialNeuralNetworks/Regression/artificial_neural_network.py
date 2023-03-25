# Importing the libraries
import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# Importing the dataset
dataset = pd.read_excel('Folds5x2_pp.xlsx')
x = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values

# Splitting the dataset into the Training set and Test set
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size = 0.2, random_state = 0)

# Scale the dataset
# Note: Doesnt HAVE to be scaled as this model has autoscaling
# sc = StandardScaler();
# sc.fit_transform(x_train)
# sc.transform(x_test)

# Initializing the ANN
ann = tf.keras.models.Sequential()

# Adding the input layer and the first hidden layer
ann.add(tf.keras.layers.Dense(units=6, activation='relu'))

# Adding the second hidden layer
ann.add(tf.keras.layers.Dense(units=6, activation='relu'))

# Adding the output layer
ann.add(tf.keras.layers.Dense(units=1)) # Activation goes to none for regression

# Compiling the ANN
ann.compile(optimizer='adam', loss='mean_squared_error')

# Training the ANN model on the Training set
ann.fit(x_train, y_train, batch_size=32, epochs=100)

# Predicting the results of the Test set
y_pred = ann.predict(x_test)
np.set_printoptions(precision=2)
print(np.concatenate((y_pred.reshape(len(y_pred), 1), y_test.reshape(len(y_test), 1)), 1))
