# -*- coding: utf-8 -*-
from __future__ import division, absolute_import, print_function
import math
import numpy as np

def func(x):
    #return 144*math.sin(x) + 12*math.sqrt(3)*math.pi + 36*x**2 + math.pi**2 - 12*math.pi*x - 72 - 72*math.sqrt(3)*x
    return 36 * np.cos(x) + 18 * np.sqrt(3) * x + 9 * (x ** 2) + (np.pi) ** 2 - 18 - 6 * np.sqrt(3) * np.pi - 6 * np.pi * x
def dfunc(x):
    #return -12*(6*math.sqrt(3) + math.pi - 6*x - 12*math.cos(x))
    return 18 * x - 36 * np.sin(x) - 6 * np.pi + 18 * np.sqrt(3)


def newton(f, df, x0, eps):
    root = x0 - f(x0)/df(x0)
    while abs(root - x0) > eps:
        x0 = root
        root = root - f(root)/df(root)
    return root

if __name__ == "__main__":
    roots = newton(func, dfunc, 0.3, 1e-5)
    print(roots)