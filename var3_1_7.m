format long
n = 6;
N = 7;
b = zeros(n,1)+N;
aij = @(i,j)(256/(5+0.1*N*i*j*0.256)^5);
A = zeros(n);
for i = 1:n
    for j = 1:n
        A(i,j) = aij(i,j);
    end
end
C = rref([A b]);
x = C(:,end)
%x = inv(A)*b
condnum = cond(A, inf);
d = zeros(n, 1);
delta = N/100;
for i = 1:n
    d(i) = norm(x - xi(A, b, i, delta),inf)/norm(x,inf);
end
dm = find(d >= max(d));
deltaxm = norm(x - xi(A, b, dm, delta), inf)/norm(x,inf);
bi = b;
bi(dm) = bi(dm) + delta;
deltabm = norm(b - bi, inf)/norm(b, inf);
if deltaxm <= condnum*deltabm
    disp('True');
else
    disp('False');
end
