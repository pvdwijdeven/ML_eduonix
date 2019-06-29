from hmmlearn.hmm import GaussianHMM
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.datasets import samples_generator
import matplotlib.pyplot as plt

X, y = samples_generator.make_blobs(n_samples=1000, centers=3, n_features=2,random_state=0)
plt.subplot(1, 2, 1)
plt.scatter(X[:,:0], X[:,:1], c=y, s=50)
plt.show()

hmm = GaussianHMM(n_components=3, algorithm='viterbi', n_iter=10, random_state = 0)

hmm.fit(X)
print(cross_val_score(hmm, X, y, cv=3))
# y_predict = hmm.predict(x)


# print(y_predict)
# print(y)


# y_predict = hmm.score(x)
