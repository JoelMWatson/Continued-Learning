import numpy as np # Mathematics on Arrays/Matrices
import matplotlib.pyplot as plt # graph visualization
import pandas as pd # data analysis and manipulation
from sklearn.tree import DecisionTreeRegressor

# bring in csv dataset
data = pd.read_csv('Position_Salaries.csv')
x = data.iloc[:, 1:-1].values
y = data.iloc[:, -1].values

# skipping the split step to use whole data set to train for future predictions

# train Decision Tree
regressor = DecisionTreeRegressor(random_state=0)
regressor.fit(x, y)

# predict with Decision Tree Regression
y_pred = regressor.predict([[6.5]])
print(y_pred);

# visualize SVR results
x_grid = np.arange(min(x), max(x), 0.1)
x_grid = x_grid.reshape((len(x_grid), 1))
plt.scatter(x, y, color='red')
plt.plot(x_grid, regressor.predict(x_grid).reshape(-1, 1), color='blue')
plt.title('Decision Tree Regression')
plt.xlabel('level')
plt.ylabel('salary')
plt.show()