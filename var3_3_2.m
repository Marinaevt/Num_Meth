A =  [3 1 0 0 0;
 1 2 1 0 0;
 0 1 1 1 0;
 0 0 1 0 1;
 0 0 0 1 1];
b = [1 2 3 4 5;
1 1 2 3 4;
1 2 1 2 3;
1 3 2 1 2;
1 4 3 2 1];
x = [];
norms = [];
normval = inf;
for i = 1:size(b, 2)
    C = rref([A b(:, i)]);
    xi = C(:,end);
    x = [x, xi];
    norms = [norms; norm(xi, normval)/norm(b(:, i), normval)];
end
NormAinv = max(norms);
NormA = norm(A, normval);
disp(NormA*NormAinv);
disp(cond(A, normval));
disp(norm(A, normval)*norm(inv(A), normval));