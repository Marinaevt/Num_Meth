function [x] = xi(A, b, i, delta)
    b(i) = b(i) + delta;
    C = rref([A b]);
    x = C(:,end);
end