x = [-0.7;
    -0.41;
    -0.12;
    0.17;
    0.46;
    0.75;
    1.04;
    1.33;
    1.62;
    1.91;
    2.20];
y = [-4.152;
    1.244;
    3.182;
    2.689;
    0.950;
    -2.743;
    -5.839;
    -7.253;
    -6.100;
    -2.144;
    6.103];
n = numel(x);
plot(x, y, 'ro')
hold on
x1 = linspace(min(x) - 0.1, max(x) + 0.1, 50);
flag = 0;
i = 1;
sigma1 = sqrt(1/(n)*sum((Poly(a, 0, x) - y).^2));
a = mnk(x, y, n, 0);
y1 = Poly(a, 0, x1);
plot(x1, y1)
while ~flag
    a = mnk(x, y, n, i);
    y1 = Poly(a, i, x1);
    plot(x1, y1)
    sigma2 = sqrt(1/(n-i)*sum((Poly(a, i, x) - y).^2))
%     if sigma2 - sigma1 > 0.1
%         flag = 1;
%     else
%         sigma1 = sigma2;
%     end
    i = i+1
end