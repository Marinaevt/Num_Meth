import numpy as np
import math

np.seterr(over='raise', under='raise')
N = 1
x = np.float64(1)
while x != math.inf:
    try:
        x *= np.float64(2)
        N += 1
    except:
        break
print(2.0**(N-1))
n = 1
x1 = np.float64(1)
while not (x1 == np.float64(0)):
    try:
        x1 /= np.float64(2)
        n += 1
    except:
        break
print(2**(-n+1))
k = 0
x2 = np.float64(1)
y2 = np.float64(2)
while y2 != np.float64(1):
    x2 /= np.float64(2)
    y2 = np.float64(1) + x2
    k += 1
print(2**(-k+1))
N = 1
x = np.float32(1)
while x != math.inf:
    try:
        x *= np.float32(2)
        N += 1
    except:
        break
print(2.0**(N-1))
n = 1
x1 = np.float32(1)
while not (x1 == np.float32(0)):
    try:
        x1 /= np.float32(2)
        n += 1
    except:
        break
print(2**(-n+1))
k = 0
x2 = np.float32(1)
y2 = np.float32(2)
while y2 != np.float32(1):
    x2 /= np.float32(2)
    y2 = np.float32(1) + x2
    k += 1
print(2**(-k+1))