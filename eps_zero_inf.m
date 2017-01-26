k = 0;
while 1 + 2.0 ^ (-k) ~= 1
    k = k + 1;
end
eps = 2 ^ (-k + 1)

n = 0;
while 2.0 ^ (-n) ~= 0
    n = n + 1;
end
zero = 2 ^ (-n + 1)

n = 0;
while 2.0^n ~= inf
    n = n+1;
end
 infin = 2.0 ^ (n - 1)
 