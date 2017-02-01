format long
x = 1:0.5:5;
y1 = [];

for i = 1:numel(x)
    y1 = [y1; fsolve(@(y)(exp(x(i)*y) - cos(x(i) * y^3)), -1, optimset('TolFun', 1e-7))];
end
f = @(x, y)(exp(x.*y) - cos(x .* y.^3));
figure
x2 = linspace(0.5, 1.5, 50);
y2 = [];
for i = 1:numel(x2)
    y2 = [y2; fsolve(@(y)(exp(x2(i)*y) - cos(x2(i) * y^3)), -1, optimset('TolFun', 1e-7))];
end
plot(x2, y2, 'r')
grid on
axis([0.5 1.5 -1.3 -0.3])
