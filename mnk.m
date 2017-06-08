function [a] = mnk(x, y, n, m)
A = zeros(m ,m);
b = zeros(m,1);
for j = 1:m
    for i = 1:n
        b(j) = b(j) + y(i)*x(i)^(j-1);
    end 
    for k = 1:m
        for i = 1:n
            A(j, k) = A(j, k) + x(i)^(k+j-2);
        end
    end
end
a = A\b;
end

