function [center, n] = bisec(f, left, right, eps)
n = 0;
while right - left > eps
    center = (right - left) / 2 + left;
    if f(center) * f(left) > 0
        left = center;
    else
        right = center;
    end
    n = n + 1;
end
end