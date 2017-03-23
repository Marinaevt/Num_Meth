# -*- coding: utf-8 -*-
from __future__ import division, absolute_import, print_function
import numpy as np


def GaussCP(A, b):
    n = A.shape[0]
    Ab = np.hstack((A, b))
    for i in range(n - 1):
        j = np.argmax(Ab[i:, i]) + i
        Ab[[i, j], :] = Ab[[j, i], :]
        mu = Ab[i + 1:, i] / Ab[i, i]
        Ab[i + 1:, :] -= Ab[i, :] * mu[:, np.newaxis]

    x = np.zeros(n)
    x[n - 1] = Ab[n - 1, n] / Ab[n - 1, n - 1]
    for j in range(n - 2, -1, -1):
        x[j] = (Ab[j, n] - np.dot(Ab[j, j + 1:n], x[j + 1:])) / Ab[j, j]
    return x


if __name__ == "__main__":
    A = np.zeros((6, 6))
    b = np.zeros((6, 1)) + 1
    for i in range(6):
        for j in range(6):
            A[i][j] = 256 / (5 + 0.1 * 7 * i * j * 0.256) ** 5
    x = GaussCP(A, b)
    #x1 = np.linalg.solve(A, b)
    print(x)
