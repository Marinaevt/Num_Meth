n = 35;
b = zeros(n, 1);

Ad = [1, 2, 5];
Aa = [220, 22, 2];

A = zeros(n, n);
for i = 1:n
    for j = 1:n
        if j == i
            A(i, j) = 220;
        end
        if j == i + 1
            A(i, j) = 22;
        end
        if j == i + 4
            A(i, j) = 2;
        end
    end
    b(i) = i * exp(22/i) * cos(11/i);
end

eps = 1e-9;
n = size(A, 1);
x = zeros(n, 1);
steps = 0;
flag = 0;
while flag == 0
    xn = x;
    for i = 1:n
        s1 = 0;
        s2 = 0;
%         for j = 1:i-1
%            s1 = s1 + A(i, j)*xn(j);
%         end
        for j = 2:numel(Ad)
            if i + 1 < n - Ad(j) + 1
                s2 = s2 + Aa(j)*x(Ad(j) + (i - 1));
            end
        end
%         for j = i+1:n
%             s2 = s2 + A(i, j)*x(j);
%         end
        xn(i) = (b(i) - s1 - s2) / Aa(1);
        
    end
    if sqrt(sum((xn - x).^2)) <= eps
        flag = 1;
    end
    x = xn;
    steps = steps + 1;
end
normval = inf;
x1 = A\b;
norm(x1 - x, normval) / norm(x1, normval)
steps





