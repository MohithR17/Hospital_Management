# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import pickle

dataset = pd.read_csv('50_Startups.csv')

# dataset['experience'].fillna(0, inplace=True)

# dataset['test_score'].fillna(dataset['test_score'].mean(), inplace=True)

X = dataset.iloc[:, :4]
print(dataset.head(5))
states = set(dataset["State"])
print(states)
#Converting words to integer values
def convert_to_int(word):
    i = 1
    state_dict = dict()
    for state in states:
        state_dict[state] = i
        i += 1

    return state_dict[word]

X['State'] = X['State'].apply(lambda x : convert_to_int(x))

print(X["State"])
#
y = dataset.iloc[:, -1]
#
#Splitting Training and Test Set
#Since we have a very small dataset, we will train our model with all availabe data.

from sklearn.linear_model import LinearRegression
regressor = LinearRegression()

#Fitting model with trainig data
regressor.fit(X, y)
#
# Saving model to disk
pickle.dump(regressor, open('model.pkl','wb'))

# Loading model to compare the results
model = pickle.load(open('model.pkl','rb'))
print(model.predict([[142107.34, 91391.77, 366168.42, 3]]))