# -*- coding: utf-8 -*-
from __future__ import division, absolute_import, print_function
from math import sqrt
import numpy as np

def seidel(A, b, x0, eps, maxiter = 100):
    n = len(A)
    x = x0.copy()
    tr = 0
    converge = False
    while not converge:
        x_new = x.copy()
        for i in range(n):
            s1 = sum(A[i][j] * x_new[j] for j in range(i))
            s2 = sum(A[i][j] * x[j] for j in range(i + 1, n))
            x_new[i] = (b[i] - s1 - s2) / A[i][i]
        ttt = sqrt(sum((x_new[i] - x[i]) ** 2 for i in range(n)))
        converge = ttt <= eps or tr == maxiter
        x = x_new
        tr += 1
    return x


if __name__ == "__main__":
    A = [[4.95, 1.12, 2.9, 0.66], [8.91, 19.9, -4.0, 6.93], [-2.97, 2.2, -5.8, 0], [5.94, 1.3, 10.5, 17.82]]
    b = [-3.41, 50.33, 19.49, -45.88]
    x0 = [0 for _ in range(len(A))]
    x1 = seidel(A, b, x0, 1e-10)
    #x2 = np.linalg.solve(A, b)
    #print(x1 - x2)
    print(x1)
