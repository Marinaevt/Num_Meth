function [r] = mnksin(x, y, a, b)
A = zeros(2 ,2);
g = zeros(2,1);
A(1, 1) = sum(sin(a*pi*x).^2);
A(1, 2) = sum(sin(a*pi*x).*cos(b*pi*x));
A(2, 1) = A(1, 2);
A(2, 2) = sum(cos(b*pi*x).^2);

g(1) = sum(y.*sin(a*pi*x));
g(2) = sum(y.*cos(b*pi*x));
r = A\g;
end

