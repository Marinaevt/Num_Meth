lam = 0.1;
ab = [0 pi];
f = @(x)(cos(x));
kk = @(x, t)(1./(5 + sin(x+t)));
h = (ab(2) - ab(1)) / 10;
t = [-0.77459666929954 0.00000000000000 0.77459666929954];
A = [0.55555555555556 0.88888888888888 0.55555555555556];
%Ig = @(ab, A, t)((ab(2) - ab(1))/2*sum(A.*Pn(c, (ab(2) + ab(1))/2 + (ab(2) - ab(1))/2.*t)));
D = [];
g = [];
n = (ab(2) - ab(1))/h;
kronk = @(i, j)(i == j);
x = linspace(ab(1), ab(2), n);
xk = [(ab(2) + ab(1))/2 + (ab(2) - ab(1))/2*t(1) (ab(2) + ab(1))/2 + (ab(2) - ab(1))/2*t(2) (ab(2) + ab(1))/2 + (ab(2) - ab(1))/2*t(3) x];
for i = 1:numel(x)+3
    for j = 1:numel(x) + 3
        D(i, j) = kronk(i, j) - kronk(i, 1)*lam*A(1)*kk(xk(j), xk(1)) - kronk(i, 2)*lam*A(2)*kk(xk(j), xk(2)) - kronk(i, 3)*lam*A(3)*kk(xk(j), xk(3));
        
    end
    g(i) = f(xk(i));
end

ksi = D \ g';
kksi = ksi(1:3);
for i = 1:numel(x)
    Ig(i) = lam*sum(A.*(kksi').*kk((ab(2) + ab(1))/2 + (ab(2) - ab(1))/2.*t, x(i))) + f(x(i));
end
%Ig = lam*sum(A.*kk((ab(2) + ab(1))/2 + (ab(2) - ab(1))/2.*t, xk)) + f(xk)

plot(x, Ig)
