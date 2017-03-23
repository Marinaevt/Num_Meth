function [x, steps] = zeidel(A, b, eps)
n = size(A, 1);
x = zeros(n, 1);
steps = 0;
flag = 0;
while flag == 0
    xn = x;
    for i = 1:n
        s1 = 0;
        s2 = 0;
        for j = 1:i-1
           s1 = s1 + A(i, j)*xn(j);
        end
        for j = i+1:n
            s2 = s2 + A(i, j)*x(j);
        end
        xn(i) = (b(i) - s1 - s2) / A(i,i);
        
    end
    if sqrt(sum((xn - x).^2)) <= eps
        flag = 1;
    end
    x = xn;
    steps = steps + 1;
end

end

