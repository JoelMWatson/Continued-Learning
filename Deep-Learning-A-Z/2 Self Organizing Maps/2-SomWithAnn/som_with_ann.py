import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler, StandardScaler
from minisom import MiniSom
from pylab import bone, pcolor, colorbar, plot, show
import tensorflow as tf

# Part 1 - Unsupervised Deep Learning

dataset = pd.read_csv('Credit_Card_Applications.csv')
x = dataset.iloc[:, :-1].values 
y = dataset.iloc[:, -1].values

## Feature Scaling
sc = MinMaxScaler(feature_range=(0, 1),)
x = sc.fit_transform(x)

##Training the SOM
som = MiniSom(x=10, y=10, input_len=15, sigma=1.0, learning_rate=0.5)
som.random_weights_init(x)
som.train_random(data=x, num_iteration=1000)

##Visualizing the results
bone()
pcolor(som.distance_map().T)
colorbar()
markers = ['o', 's']
colors = ['r', 'g']
for i, v in enumerate(x):
    w = som.winner(v)
    plot(w[0]+.5,
         w[1]+.5,
         markers[y[i]],
         markeredgecolor=colors[y[i]], 
         markerfacecolor=None, 
         markersize=10, 
         markeredgewidth=2)
show()

## Finding the frauds
mappings = som.win_map(x)
frauds = np.concatenate((mappings[(5,1)], mappings[(8,7)]), axis=0)
frauds = sc.inverse_transform(frauds)


# Part 2 - Going from Unsupervised to Supervised Deep Learning

## Create Matrix of Features
customers = dataset.iloc[:, 1:].values 

## Create Dependent Variable
is_fraud = np.zeros(len(dataset))
for i in range(len(dataset)):
    if dataset.iloc[i,0] in frauds:
        is_fraud[i] = 1;

# Part 3 - ANN

# Feature Scaling
sc = StandardScaler()
customers = sc.fit_transform(customers)

# Part 2 - Building the ANN

# Initializing the ANN
ann = tf.keras.models.Sequential();

# Adding the input layer and the first hidden layer
ann.add(tf.keras.layers.Dense(units=2, kernel_initializer='uniform', activation='relu', input_dim=15))

# Adding the output layer
ann.add(tf.keras.layers.Dense(units=1, kernel_initializer='uniform', activation='sigmoid')) # activation goes to sigmoid for binary classification and softmax for non-binary

# Compiling the ANN
ann.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Training the ANN on the Training set
ann.fit(customers, is_fraud, batch_size=1, epochs=2)

# Predicting the prababilities of fraud
y_pred = ann.predict(customers)
y_pred = np.concatenate((dataset.iloc[:, 0:1].values, y_pred), axis=1)
y_pred = y_pred[y_pred[:, 1].argsort()]


