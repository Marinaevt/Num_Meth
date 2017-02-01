function [root, n] = newton(f, df, x0, eps)
root = x0 - f(x0) / df(x0);
n = 0;
while abs(root - x0) > eps
    x0 = root;
    root = root - f(root) / df(root);
    n = n + 1;
end