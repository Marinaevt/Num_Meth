format long
fun = @(x)(log(x).^2 - 5*log(x) + 6);
x = linspace(5, 25, 200);
plot(x, fun(x), 'r')
hold on
grid on
y1 = bisec(fun, 5, 25, 1e-10)
fzero(fun, 5)
y2 = bisec(fun, 15, 25, 1e-10)
fzero(fun, 15)
plot(y1, 0, 'gx')
plot(y2, 0, 'gx')

hold off
figure
fun2 = @(x)(log(x).^2 - 4*log(x) + 4);
plot(x, fun2(x), 'r')
hold on
grid on
y1 = bisec(fun2, 5, 25, 1e-10)
fzero(fun2, 5)
y2 = bisec(fun2, 15, 25, 1e-10)
fzero(fun2, 15)
plot(y1, 0, 'gx')
plot(y2, 0, 'gx')