A = [4.95 1.12 2.9 0.66;
8.91 19.9 -4.0 6.93;
-2.97 2.2 -5.8 0;
5.94 1.3 10.5 17.82];

b = [-3.41;
50.33;
19.49;
-45.88];

normval = inf;

x1 = A\b;
x2 = simpleitern(A, b, 10);
norm(x1 - x2, normval)/norm(x1, normval)
