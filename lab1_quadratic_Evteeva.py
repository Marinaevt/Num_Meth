# -*- coding: utf-8 -*-
from __future__ import division, absolute_import, print_function
import cmath, math

def solve_quadratic(b, c):
    D = b*b - 4*c
    if D < 0:
        D = cmath.sqrt(D)
    else:
        D = math.sqrt(D)
    if b > 0:
        x1 = (-b-D)/2
    else:
        x1 = (-b+D)/2
    x2 = c/x1
    return x1, x2

if __name__ == "__main__":
    b = float(input())
    c = float(input())
    roots = solve_quadratic(b, c)
    print(roots)
    #print(roots[0] * roots[0] + (b * roots[0] + c))
    #print(roots[1] * roots[1] + (b * roots[1] + c))