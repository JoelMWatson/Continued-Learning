import numpy as np
import pandas as pd
import torch
import torch.nn as nn
import torch.nn.parallel
import torch.optim as optim
import torch.utils.data
from torch.autograd import Variable

## Importing the dataset
#movies = pd.read_csv("ml-1m/movies.dat", sep="::", header=None, engine="python", encoding="latin-1")
#users = pd.read_csv("ml-1m/users.dat", sep="::", header=None, engine="python", encoding="latin-1")
#ratings = pd.read_csv("ml-1m/ratings.dat", sep="::", header=None, engine="python", encoding="latin-1")

## Preparing the training set and the test set
training_set = pd.read_csv('ml-100k/u1.base', delimiter='\t')
training_set = np.array(training_set, dtype='int')

test_set = pd.read_csv('ml-100k/u1.test', delimiter='\t')
test_set = np.array(test_set, dtype='int')

## Getting the number of users and movies
num_users = int(max(max(training_set[:, 0]), max(test_set[:, 0])))
num_movies = int(max(max(training_set[:, 1]), max(test_set[:, 1])))

## Converting the data into an array with users in lines and movies in columns
def convert(data):
    new_data = []
    for user_id in range(1, num_users+1):
        movie_ids = data[:,1][data[:,0] == user_id]
        rating_ids = data[:,2][data[:,0] == user_id]
        ratings = np.zeros(num_movies)
        ratings[movie_ids-1] = rating_ids
        new_data.append(ratings)
    return new_data
training_set = convert(training_set)
test_set = convert(test_set)

## Converting the data into Torch tensors
training_set = torch.FloatTensor(training_set)
test_set = torch.FloatTensor(test_set)


## Converting the ratings into binary ratings 1 (Liked) or 0 (Not Liked)
training_set[training_set == 0] = -1 # unrated
training_set[training_set == 1] = 0 # low rating
training_set[training_set == 2] = 0 # low rating
training_set[training_set >= 3] = 1 # high rating

test_set[test_set == 0] = -1 # unrated
test_set[test_set == 1] = 0 # low rating
test_set[test_set == 2] = 0 # low rating
test_set[test_set >= 3] = 1 # high rating


## Creating the architecture of the Neural Network
class RBM():
    def __init__(self, nodes_visible, nodes_hidden):
        self.weights = torch.randn(nodes_hidden, nodes_visible)
        self.bias_hidden = torch.randn(1, nodes_hidden)
        self.bias_visible = torch.randn(1, nodes_visible)
        
    def sample_hidden(self, x):
        wx = torch.mm(x, self.weights.t())
        activation = wx + self.bias_hidden.expand_as(wx)
        probability_of_hidden_given_visible = torch.sigmoid(activation)
        return probability_of_hidden_given_visible, torch.bernoulli(probability_of_hidden_given_visible)
    
    def sample_visible(self, y):
        wy = torch.mm(y, self.weights)
        activation = wy + self.bias_visible.expand_as(wy)
        probability_of_visible_given_hidden = torch.sigmoid(activation)
        return probability_of_visible_given_hidden, torch.bernoulli(probability_of_visible_given_hidden)
    
    def train(self, v0, vk, ph0, phk):
        self.weights += (torch.mm(v0.t(), ph0) - torch.mm(vk.t(), phk)).t()
        self.bias_visible += torch.sum((v0 - vk), 0)
        self.bias_hidden += torch.sum((ph0 - phk), 0)
        
nodes_visible = len(training_set[0]) # 1682 movies
nodes_hidden = 100 # 100 features to detect (totally tunable param)
batch_size = 100 # 100 per batch before updating weights (totally tunable param)
rbm = RBM(nodes_visible, nodes_hidden)

## Training the RBM
epochs = 10
for epoch in range(1, epochs +1):
    train_loss = 0
    s = 0.0
    for id_user in range(0, num_users - batch_size, batch_size):## Get batch
        vk = training_set[id_user:id_user+batch_size]
        v0 = training_set[id_user:id_user+batch_size]
        ph0,_ = rbm.sample_hidden(v0)
        for k in range(10):                                     ## Walk through sampling raitings
            _,hk = rbm.sample_hidden(vk)
            _,vk = rbm.sample_visible(hk)
            vk[v0<0] = v0[v0<0]                                 ## Reset -1 ratings to -1 (dont train on them)       
        phk,_ = rbm.sample_hidden(vk)
        rbm.train(v0, vk, ph0, phk)                             ## Update Weights of RBM
        train_loss += torch.mean(torch.abs(v0[v0>=0] - vk[v0>=0]))             ## Compare
        s += 1.0
    print('epoch: ' + str(epoch) + '\ntrain loss: ' + str((train_loss/s).item()))

## Testing the RBM ## Markov chain Monte Carlo 
test_loss = 0
s = 0.0
for id_user in range(num_users):
    v = training_set[id_user:id_user+1]
    vt = test_set[id_user:id_user+1]
    if len(vt[vt>=0]) > 0:
        _,h = rbm.sample_hidden(v)
        _,v = rbm.sample_visible(h)
        test_loss += torch.mean(torch.abs(vt[vt>=0] - v[vt>=0]))             ## Compare
        s += 1.0
print('test loss: ' + str((test_loss/s).item()))
