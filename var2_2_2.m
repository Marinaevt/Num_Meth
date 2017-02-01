format long
fun = @(x)(x.*exp(x) - x - 1);
dfun = @(x)(exp(x)*(x + 1) - 1);
x = linspace(0, 10, 100);
plot(x, fun(x), 'r')
grid on
hold on
[y1, n1] = bisec(fun, 0, 10, 1e-6)
plot(y1, 0, 'gx')
[y2, n2] = newton(fun, dfun, 5, 1e-6)
plot(y2, 0, 'gx')