function [P] = Poly(a, m ,t)
P = 0;
for i = 1:m
    P = P + a(i)*t.^(i-1);
end
end

