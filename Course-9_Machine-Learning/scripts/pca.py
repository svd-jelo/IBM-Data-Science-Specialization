import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

sns.set_theme()

rng = np.random.default_rng(seed=1)
X = np.dot(rng.random((2, 2)), rng.random((2, 200))).T
plt.scatter(X[:, 0], X[:, 1])
plt.axis("equal")
plt.show()
