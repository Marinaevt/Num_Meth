from math import sqrt


def seidel(A, b, eps):
    n = len(A)
    x = [0 for i in range(n)]
    tr = 0
    converge = False
    while not converge:
        x_new = x.copy()
        for i in range(n):
            s1 = sum(A[i][j] * x_new[j] for j in range(i))
            s2 = sum(A[i][j] * x[j] for j in range(i + 1, n))
            x_new[i] = (b[i] - s1 - s2) / A[i][i]
        ttt = sqrt(sum((x_new[i] - x[i]) ** 2 for i in range(n)))
        converge = ttt <= eps
        x = x_new
        tr += 1
    return x



A = [[4.95, 1.12, 2.9, 0.66], [8.91, 19.9, -4.0, 6.93], [-2.97, 2.2, -5.8, 0], [5.94, 1.3, 10.5, 17.82]]
b = [-3.41, 50.33, 19.49, -45.88]
seidel(A, b, 1e-10)