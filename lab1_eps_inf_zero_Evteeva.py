import numpy as np
import math

np.seterr(over='raise', under='raise')
ftype = np.float64

one = ftype(1)
two = ftype(2)

N = 1
x = one
while x != math.inf:
    try:
        x *= two
        N += 1
    except:
        break
print(2.0**(N-1))


n = 1
x1 = one
while not (x1 == ftype(0)):
    try:
        x1 /= two
        n += 1
    except:
        break
print(2**(-n+1))



k = 0
x2 = one
y2 = two
while y2 != one:
    x2 /= two
    y2 = one + x2
    k += 1
print(2**(-k+1))


ftype = np.float32

one = ftype(1)
two = ftype(2)

N = 1
x = one
while x != math.inf:
    try:
        x *= two
        N += 1
    except:
        break
print(2.0**(N-1))


n = 1
x1 = one
while not (x1 == ftype(0)):
    try:
        x1 /= two
        n += 1
    except:
        break
print(2**(-n+1))



k = 0
x2 = one
y2 = two
while y2 != one:
    x2 /= two
    y2 = one + x2
    k += 1
print(2**(-k+1))