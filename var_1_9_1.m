% A = [31 27 22;
% 32.2 28.2 24;
% 36 32 27];
% alpha = 0.1;
% beta = 0.4;
A = [10 15 1;0.7 5.7 -9;11 16 2];
alpha = 0.05;
beta = 0.1;
dets = det(A)
flag = zeros(2, 9);
flag(1, :) = 1;
dets1 = [];
dets2 = [];
for i = 1:512
    B = A;
    C = A;
    for j = 1:3
        for k = 1:3
            B(j, k) = (1 + flag(1, 3*(j-1) + k)*alpha) * B(j, k);
            C(j, k) = (1 + flag(1, 3*(j-1) + k)*beta) * C(j, k);
        end
    end
    dets1 = [dets1; det(B)];
    dets2 = [dets2; det(C)];
    flag(2, :) = flag(2, :) + 1;
    for j = 1:9
        if flag(2, j) == 2^(j-1)
            flag(2, j) = 0;
            flag(1, j) = -flag(1, j);
        end
    end
%     flag(1, :)
end
min(dets1)
max(dets1)
min(dets2)
max(dets2)

d1 = abs(dets - min(dets1))/abs(dets)
d2 = abs(dets - max(dets1))/abs(dets)
d3 = abs(dets - min(dets2))/abs(dets)
d4 = abs(dets - max(dets2))/abs(dets)