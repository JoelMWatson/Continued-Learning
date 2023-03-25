import numpy as np
import matplotlib as plt
import pandas as pd
from apyori import apriori

# data preprocessing
dataset = pd.read_csv("Market_Basket_optimisation.csv", header=None)
transactions = []
for i in range(0, 7501):
    transactions.append([str(dataset.values[i,j]) for j in range(0, 20)])

# train the model to find the rules
rules = apriori(transactions=transactions, min_support=0.003, min_confidence=0.2, min_lift=3, min_length=2, max_length=2)
results = list(rules)

# organize the rules into Pandas DataFrame
def inspect(results):
    lhs         = [tuple(result[2][0][0])[0] for result in results]
    rhs         = [tuple(result[2][0][1])[0] for result in results]
    supports    = [result[1] for result in results]
    return list(zip(lhs, rhs, supports))
resultsinDataFrame = pd.DataFrame(inspect(results), columns = ['Product 1', 'Product 2', 'Support'])

# sort rules
resultsinDataFrame.nlargest(n=10, columns="Support")