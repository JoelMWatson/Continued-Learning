# Natural Language Processing

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import re
import nltk
nltk.download('stopwords')
from nltk.corpus import stopwords # (unhelpful words for analysis: an, I, he, she, etc...)
from nltk.stem.porter import PorterStemmer
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score, confusion_matrix

# Importing the dataset
dataset = pd.read_csv('Restaurant_Reviews.tsv', delimiter = '\t', quoting = 3) # 3 = ignore all quotation marks

# Cleaning the texts
all_stopwords = stopwords.words('english')
all_stopwords.remove('not')
corpus = []
for i in range(0, 1000):
  review = re.sub('[^a-zA-Z]', ' ', dataset['Review'][i]) # remove punctuation
  review = review.lower() # remove uppercase
  review = review.split() # split into words array for stemming
  ps = PorterStemmer()
  review = [ps.stem(word) for word in review if not word in set(all_stopwords)] # remove stopwords and stem each word
  review = ' '.join(review) # join the array back into a string with spaces between words
  corpus.append(review)

# Creating the Bag of Words model
cv = CountVectorizer(max_features=1500)
x = cv.fit_transform(corpus).toarray()
y = dataset.iloc[:, -1].values

# Splitting the dataset into the Training set and Test set
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)

# Training the Naive Bayes model on the Training set
nb = GaussianNB()
nb.fit(x_train, y_train)

# Predicting the Test set results
y_pred = nb.predict(x_test)

# Making the Confusion Matrix
print(confusion_matrix(y_test, y_pred))
print(accuracy_score(y_test, y_pred))
