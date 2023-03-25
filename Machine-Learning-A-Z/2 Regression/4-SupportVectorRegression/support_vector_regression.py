import numpy as np # Mathematics on Arrays/Matrices
import matplotlib.pyplot as plt # graph visualization
import pandas as pd # data analysis and manipulation
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVR

# bring in csv dataset
data = pd.read_csv('Position_Salaries.csv')
x = data.iloc[:, 1:-1].values
y = data.iloc[:, -1].values

# transform y to array of arrays
y = y.reshape(len(y), 1)

# skipping the split step to use whole data set to train for future predictions

# feature scaling
sc_x = StandardScaler()
x = sc_x.fit_transform(x)
sc_y = StandardScaler()
y = sc_y.fit_transform(y)

# train the SVR
regressor = SVR(kernel='rbf')
regressor.fit(x, y)

# predict with SVR
y_pred = sc_y.inverse_transform(regressor.predict(sc_x.transform([[6.5]])).reshape(-1, 1))

# visualize SVR results
x_grid = np.arange(min(sc_x.inverse_transform(x)), max(sc_x.inverse_transform(x)), 0.1)
x_grid = x_grid.reshape((len(x_grid), 1))
plt.scatter(sc_x.inverse_transform(x), sc_y.inverse_transform(y), color='red')
plt.plot(x_grid, sc_y.inverse_transform(regressor.predict(sc_x.transform(x_grid)).reshape(-1, 1)), color='blue')
plt.title('SVR')
plt.xlabel('level')
plt.ylabel('salary')
plt.show()
