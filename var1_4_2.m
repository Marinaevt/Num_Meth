A = [0.6 4.5 0.3 3;
-2.4 -12 0.9 -7;
 1.2 9 0.6 6;
-1.2 3 3.6 4];
rank(A)
B = A;
B(1, 1) = A(1,1)+A(1,1)*0.1/100;
rank(B)
C = A;
for i = 1:4
    for j = 1:4
        C(i, j) = A(i, j) + A(i, j)*0.1/100;
    end
end
rank(C)