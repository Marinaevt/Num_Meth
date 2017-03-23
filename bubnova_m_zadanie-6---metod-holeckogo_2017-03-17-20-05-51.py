
# coding: utf-8


import math
from math import sqrt
import numpy as np
 
def Cholesky(A):
    n = 40
    m = 10

    L = np.zeros((n,n))

    for k in range(n):
        for i in range(n):
            
            if i == 0:
                e = A[k][k]
                for j in range(k - 1):
                    e = e - L[k][j]**2
                L[k][k] = sqrt(e)
            
            tmp_sum = sum(L[i][j] * L[k][j] for j in range(k - 1))
            
            if (i == k): 
                L[i][k] = sqrt(A[i][i] - tmp_sum)
            else:
                L[i][k] = (1.0 / L[k][k] * (A[i][k] - tmp_sum))
    return L


n = 40
m = 10
A = np.zeros((n,n))

for i in range(1,n+1):
    for j in range(1,1+n):
        if i != j:
            A[i-1][j-1] = (i+j)/(m+n)
        else:
            A[i-1][j-1] = n + m**2 + j/m + i/n
b = np.zeros((n))
for k in range(1,n+1):
    b[k-1] = n*k + m
    
L = Cholesky(A)

y = np.linalg.solve(L, b)

# Solution
x = np.linalg.solve(np.transpose(L), y)
print(x)

