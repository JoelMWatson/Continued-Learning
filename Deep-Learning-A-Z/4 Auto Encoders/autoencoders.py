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


## Creating the architecture of the Neural Network
class SAE(nn.Module):
    def __init__(self, ):
        super(SAE, self).__init__()
        self.full_connection1 = nn.Linear(num_movies, 20)   # Encoding
        self.full_connection2 = nn.Linear(20, 10)           # Encoding
        self.full_connection3 = nn.Linear(10, 20)           # Decoding 
        self.full_connection4 = nn.Linear(20, num_movies)   # Decoding
        self.activation = nn.Sigmoid()
        
    def forward(self, x):
        x = self.activation(self.full_connection1(x))
        x = self.activation(self.full_connection2(x))
        x = self.activation(self.full_connection3(x))
        x = self.full_connection4(x)
        return x
    
sae = SAE()
criterion = nn.MSELoss()
optimizer = optim.RMSprop(sae.parameters(), lr=0.01, weight_decay=0.5)
        

## Training the SAE
num_epoch = 200;
for epoch in range(1, num_epoch+1):
    train_loss = 0
    s = 0.0
    for user in range(num_users):
        input = Variable(training_set[user]).unsqueeze(0)
        target = input.clone()
        if torch.sum(target.data > 0) > 0:
            output = sae(input)
            target.require_grad = False
            output[target == 0] = 0
            loss = criterion(output, target)
            mean_corrector = num_movies/float(torch.sum(target.data > 0) + 1e-10)
            loss.backward()
            train_loss += np.sqrt(loss.data.item() * mean_corrector)
            s += 1.0
            optimizer.step()
    print("epoch: " + str(epoch) + " loss: " + str(train_loss/s))

## Testing the SAE
test_loss = 0
s=0.0
for user in range(num_users):
    input = Variable(training_set[user]).unsqueeze(0)
    target = Variable(test_set[user]).unsqueeze(0)
    if torch.sum(target.data>0) >0:
        output = sae(input)
        target.require_grad = False
        output[target == 0] = 0
        loss = criterion(output, target)
        mean_corrector = num_movies/float(torch.sum(target.data > 0) + 1e-10)
        test_loss += np.sqrt(loss.data.item() * mean_corrector)
        s += 1.0
print("test loss: " + str(test_loss/s))
    
    
