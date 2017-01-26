syms n
s = double(symsum(24/(n^2 + 8*n + 15), 0, inf));
d = [];
for i = 1:5
    d = [d; abs(double(symsum(24/(n^2 + 8*n + 15), 0, 10^i)) - s)];
end
format long
d
d/s