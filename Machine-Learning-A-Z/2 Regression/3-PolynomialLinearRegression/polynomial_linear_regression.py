import numpy as np # Mathematics on Arrays/Matrices
import matplotlib.pyplot as plt # graph visualization
import pandas as pd # data analysis and manipulation
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures

# bring in csv dataset
data = pd.read_csv('Position_Salaries.csv')
x = data.iloc[:, 1:-1].values
y = data.iloc[:, -1].values

# Skipping the split step to use whole data set to train for future predictions
# # split dataset into training and test
# x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)

# train the linear regression
lin_reg = LinearRegression()
lin_reg.fit(x, y)

# train the polynomial regression
# pf = PolynomialFeatures(degree=2)
pf = PolynomialFeatures(degree=4) # overfit
x_poly = pf.fit_transform(x)
lin_reg2 = LinearRegression()
lin_reg2.fit(x_poly, y)

# visualize linear regression
plt.scatter(x, y, color='red')
plt.plot(x, lin_reg.predict(x), color='blue')
plt.title('Linear Regression')
plt.xlabel('level')
plt.ylabel('salary')
plt.show()

# visualize polynomial regression
x_grid = np.arange(min(x), max(x), 0.1)
x_grid = x_grid.reshape((len(x_grid), 1))
plt.scatter(x, y, color='red')
plt.plot(x_grid, lin_reg2.predict(pf.fit_transform(x_grid)), color = 'blue')
plt.title('Polynomial Regression')
plt.xlabel('level')
plt.ylabel('salary')
plt.show()

# predict with linear regression
lin_pred = lin_reg.predict([[6.5]])
print(lin_pred)

# predict with polynomial regression
poly_pred = lin_reg2.predict(pf.fit_transform([[6.5]]))
print(poly_pred)