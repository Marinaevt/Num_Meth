# coding: utf-8

import numpy as np

def GaussCP(A, b):
    n = A.shape[0]
    Ab = np.hstack((A, b))
    
    # прямой ход
    for i in range(n-1):
        j = np.argmax(Ab[i:,i])+i # поиск максимума по столбцу ниже i-й строки
        Ab[[i,j],:] = Ab[[j,i],:] # перестановка i и j строк (без копирования)
        mu = Ab[i+1:,i] / Ab[i,i] # вычисление коэффициентов mu
        Ab[i+1:,:] -= Ab[i,:] * mu[:,np.newaxis] # вычитание i строки из остальных с учетом mu
    
    # обратный ход
    x = np.zeros(n)
    x[n-1] = Ab[n-1,n] / Ab[n-1,n-1] # вычисление последнего неизвестного
    for j in range(n-2,-1,-1):
        x[j] = (Ab[j,n] - np.dot(Ab[j,j+1:n],x[j+1:])) / Ab[j, j]   
    return x



A = np.zeros((6,6))
b = np.array([[1., 1., 1., 1., 1., 1.]]).T

for i in range(6):
    for j in range(6):
        c = 0
        c = 0.1*1*i*j
        A[i][j] = 15/(4 * c**5 + 6*c + 1)

x = GaussCP(A, b)
x1 = np.linalg.solve(A, b)
print(x)



