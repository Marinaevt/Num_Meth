function [x] = simpleitern(A, b, steps)
n = size(A, 1);
d = zeros(n, 1);
step = 0;
for i = 1:n
    for j = 1:n
        if i~=j
            C(i, j) = A(i,j)/A(i, i);
        end
    end
    d(i) = b(i)/A(i, i);
end

flag = 0;
x = d;
while flag == 0
    xn = d - C*x;
    
    if step >= steps
        flag = 1;
    end
    x = xn;
    step = step + 1;
end

end

