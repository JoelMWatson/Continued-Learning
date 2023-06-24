import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
from minisom import MiniSom
from pylab import bone, pcolor, colorbar, plot, show

## Importing the dataset

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

frauds = np.concatenate((mappings[(3,7)], mappings[(1,3)]), axis=0)
frauds = sc.inverse_transform(frauds)

##Printing the Fraunch Clients
for i in frauds[:, 0]:
    print(i)
