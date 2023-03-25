# Upper Confidence Bound (UCB)

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math

# Importing the dataset
dataset = pd.read_csv('Ads_CTR_Optimisation.csv')

# Implementing UCB
n = 10000
d = 10
ads_selected = []
selected_counts = [0] * d
reward_sums = [0] * d 
total_reward = 0
for i in range(0,n):
    ad = 0
    max_upper_bound = 0
    for j in range(0,d):
        if (selected_counts[j] > 0):
            avg_reward = reward_sums[j]/selected_counts[j]
            delta = math.sqrt(3/2 * math.log(i+1)/selected_counts[j])
            upper_bound = avg_reward + delta
        else:
            upper_bound = 1e400
        if (upper_bound > max_upper_bound):
            max_upper_bound = upper_bound
            ad = j
    ads_selected.append(ad)
    selected_counts[ad] += 1
    reward = dataset.values[i, ad]
    reward_sums[ad] += reward
    total_reward += reward


# Visualising the results
plt.hist(ads_selected)
plt.title('Histogram of ads selections')
plt.xlabel('Ads')
plt.ylabel('Number of times each ad was selected')
plt.show()