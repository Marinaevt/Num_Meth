x = [-2.0;
    -1.6;
    -1.2;
    -0.8;
    -0.4;
    0;
    0.4;
    0.8;
    1.2;
    1.6;
    2.0];
y = [1.649;
    1.942;
    2.142
    2.274;
    2.35;
    2.375;
    2.35;
    2.274;
    2.142;
    1.942;
    1.649];
t = x.^2;
s = y.^2;
n = numel(x);
plot(x, y, 'go')
hold on
plot(t, s, 'ro')
hold on
x1 = linspace(min(x) - 0.1, max(x) + 0.1, 50);
a = mnk(t, s, n, 2)
y1 = Poly(a, 2, x1);
y2 = sqrt(a(1) + a(2)*x1.^2);
plot(x1, y1)
plot(x1, y2)