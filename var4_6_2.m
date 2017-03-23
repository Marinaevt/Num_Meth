n = 35;
A1 = zeros(1, n + 1) + 220;
A1(1) = 1;
A2 = zeros(1, n) + 22; %вычитаем номер диагонали, считая главную 0 и прибавляем 1 на индекс
A2(1) = 2;
A3 = zeros(1, n - 3) + 2; %вычитаем номер диагонали, считая главную 0 и прибавляем 1 на индекс
A3(1) = 5;
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
        if i + 1 < numel(A2) - 1
            s2 = s2 + A2(i + 1)*x(A2(1) + (i - 1));
        end
        if i + 1 < numel(A3) - 1
            s2 = s2 + A3(i + 1)*x(A3(1) + (i - 1));
        end
%         for j = i+1:n
%             s2 = s2 + A(i, j)*x(j);
%         end
        xn(i) = (b(i) - s1 - s2) / A1(i + 1);
        
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





