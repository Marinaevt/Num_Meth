# -*- coding: utf-8 -*-
from __future__ import division, absolute_import, print_function
import math

def func(x):
    return math.log(x)**2 - 5*math.log(x) + 6

def bisec(f, left, right, eps):
    while right - left > eps:
        center = (right - left)/2 + left
        if f(center) * f(left) > 0:
            left = center
        else:
            right = center
    return center

if __name__ == "__main__":
    roots = [bisec(func, 5, 25, 10**(-2)), bisec(func, 15, 25, 10**(-2))]
    print(' '.join(map(str, roots)))