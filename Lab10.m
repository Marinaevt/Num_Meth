A1 =[10 15 1;0.7 5.7 -9;11 16 2];
detA1 = det(A1);
n = [];
for i=1:512
    n = [n;de2bi(i, 10)];
end
A = [10 15 1 0.7 5.7 -9 11 16 2];
detA = A(1)*A(5)*A(9) + A(2)*A(6)*A(7) + A(3)*A(4)*A(8) ...
    - A(3)*A(5)*A(7) - A(1)*A(6)*A(8) - A(2)*A(4)*A(9)
det_matr_alpha = [];

det_matr_betta = [];

alpha = 0.05;
betta = 0.1;

for k = 1:512;
    for j = 1:10;
        if n(k, j) == 1
            n(k, j) = 1;
        else
            n(k, j) = -1;
        end
    end
end

for k = 1:512;
    H = A;
    for j = 1:9;
        H(j) = H(j) + n(k,j)*alpha;
    end
    detH = H(1)*H(5)*H(9) + H(2)*H(6)*H(7) + H(3)*H(4)*H(8) ...
    - H(3)*H(5)*H(7) - H(1)*H(6)*H(8) - H(2)*H(4)*H(9)
    det_matr_alpha = [det_matr_alpha detH];
end

for k = 1:512;
    H1 = A;
    for j = 1:9;
        H1(j) = H1(j) + n(k,j)*betta;
    end
    detH1 = H1(1)*H1(5)*H1(9) + H1(2)*H1(6)*H1(7) + H1(3)*H1(4)*H1(8) ...
    - H1(3)*H1(5)*H1(7) - H1(1)*H1(6)*H1(8) - H1(2)*H1(4)*H1(9)
    det_matr_betta = [det_matr_betta detH1];
end

m_alpha = min(det_matr_alpha)
M_alpha = max(det_matr_alpha)
m_betta = min(det_matr_betta)
M_betta = max(det_matr_betta)