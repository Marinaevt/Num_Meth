n = 20;
m = 8;
b = zeros(n, 1);
A = zeros(n);
for i = 1:n
    for j = 1:n
        if i == j
            A(i, j) = n + m^2 + j/m + i/n;
        else
            A(i, j) = (i + j)/(m + n);
        end
    end
    b(i) = 200 + 50*i;
end
L = zeros(n);
for i = 1:n
    for j = 1:n
        lik = 0;
        for k = 1:j-1
            lik = lik + L(i, k)*L(j, k);
        end
        if i == j
            L(i, j) = sqrt(A(i, j) - lik);
        elseif j < i
            L(i, j) = 1/L(j, j)*(A(i, j) - lik);
        end
    end
end
y = zeros(n, 1);
y(1) = b(1);
for i = 2:n
    lij = 0;
    for j = 1:i-1
        lij = lij + L(i, j)*y(j);
    end
    y(i) = b(i) - lij;
end
U = L.';
x = zeros(n, 1);
x(n) = y(n)*U(n, n);
for i = n-1:-1:1
    uij = 0;
    for j = i+1:n
        uij = uij + U(i,j)*x(j);
    end
    x(i) = (y(i) - uij)/U(i, i);
end

D = zeros(n);
for i = 1:n
    D(i, i) = 1/U(i,i);
end
for i = 1:n
    for j = i:n
        if i ~= j
            dik = 0;
            for k = i:j
                dik = dik + D(i, k)*U(k,j);
            end
            D(i, j) = -(dik)/D(j, j);
        end
    end
end
C = zeros(n);
for j = n:-1:1
    for i = 1:j
        sum = 0;
        for k = j:n
            sum = sum + C(i, k)*L(k, j);
        end
        C(i, j) = (D(i, k) - sum);
    end
    for i = j:n
        sum = 0;
        for k = j:n
            sum = sum + C(i, k)*L(k, j);
        end
        C(i, j) = -sum;
    end
end
normval = inf;
disp(norm(A, normval) * norm(C, normval));
disp(norm(A, normval) * norm(inv(A), normval));
disp(cond(A, normval))
