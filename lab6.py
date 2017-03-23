# -*- coding: utf-8 -*-
from __future__ import division, absolute_import, print_function
from math import sqrt
import numpy as np


def Ch(A, n):
    L = np.zeros((n, n))
    for i in range(n):
        for j in range(i):
            tt = 0
            for k in range(j):
                tt += L[i, k]*L[j, k]
            L[i, j] = (A[i, j] - tt)/L[j, j]
        tt = A[i, i]
        for k in range(i):
            tt -= L[i, k] * L[i, k]
        L[i, i] = sqrt(tt)
    return L


if __name__ == "__main__":
    n = 40
    m = 10
    A = np.zeros((n, n))

    for i in range(n):
        for j in range(n):
            if i == j:
                A[i, j] = n + m**2 + j/m + i/n
            else:
                A[i, j] = (i + j) / (m + n)
    b = np.zeros((n))
    for k in range(1, n + 1):
        b[k - 1] = n * k + m

    L = Ch(A, n)
    '''
    y = np.zeros((n))
    y[0] = b[0]
    for i in range(1, n):
        lij = 0
        for j in range(i):
            lij += L[i, j]*y[j]
        y[i] = b[i] - lij
    U = L.transpose()
    x = np.zeros((n))
    x[n-1] = y[n-1]*U[n-1, n-1]
    for i in range(n-2, -1, -1):
        uij = 0
        for j in range(i+1, n):
            uij += U[i, j]*x[j]
        x[i] = (y[i] - uij)/U[i, i]
    '''
    y = np.linalg.solve(L, b)
    x = np.linalg.solve(np.transpose(L), y)
    #x1 = np.linalg.solve(A, b)
    print(x)