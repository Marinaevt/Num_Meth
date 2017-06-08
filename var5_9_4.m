f = @(x)(6*sin(x)./x);
a = 5;
b = 15;
x = linspace(a, b, 100);
y = f(x);
plot(x, y, 'cp')
hold on
for i = 3:15
    x1 = linspace(a, b, i);
    y1 = f(x1);
    plot(x, ppval(spline(x1, y1), x), 'LineWidth',i/8)
end