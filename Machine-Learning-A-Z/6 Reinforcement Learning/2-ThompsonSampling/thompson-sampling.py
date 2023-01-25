# Upper Confidence Bound (UCB)

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import random

# Importing the dataset
dataset = pd.read_csv('Ads_CTR_Optimisation.csv')

# Implementing thompson sampling
n = 10000
d = 10
ads_selected = []
num_of_rewards_1 = [0] * d
num_of_rewards_0 = [0] * d
total_rewards = 0
for i in range(0, n):
    ad = 0
    max_random_draw = 0
    for j in range(0, d):
        random_draw = random.betavariate(num_of_rewards_1[j] + 1, num_of_rewards_0[j]+1)        
        if random_draw > max_random_draw:
            max_random_draw = random_draw
            ad = j
    ads_selected.append(ad)
    reward = dataset.values[i, ad]
    if reward == 1:
        num_of_rewards_1[ad]+=1
    else:
        num_of_rewards_0[ad]+=1
    total_rewards+=reward
    
# Visualising the results
plt.hist(ads_selected)
plt.title('Histogram of ads selections')
plt.xlabel('Ads')
plt.ylabel('Number of times each ad was selected')
plt.show()