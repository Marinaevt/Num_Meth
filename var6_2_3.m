ab = [0 1];
c = [0.1 -0.1 1 1 1 1];
h = (ab(2) - ab(1))/2;

I = @(ab)(c(1)*ab(2) - c(1)*ab(1) + c(2)*ab(2)^2/2 - c(2)*ab(1)^2/2 + ...
c(3)*ab(2)^3/3 - c(3)*ab(1)^3/3 + c(4)*ab(2)^4/4 - c(4)*ab(1)^4/4 + ...
c(5)*ab(2)^5/5 - c(5)*ab(1)^5/5 + c(6)*ab(2)^6/6 - c(6)*ab(1)^6/6);
Ian = I(ab);

%x = linspace(ab(1), ab(2), 50);
Pn = @(c, x)(c(1) + c(2).*x + c(3).*x.^2 + c(4).*x.^3 + c(5).*x.^4 + c(6).*x.^5);
%plot(x, Pn(c, x))
%trap
for i = 1:6
    ci = zeros(6, 1);
    ci(1:i) = c(1:i);
    figure
    x = linspace(ab(1), ab(2), 50);
    %plot(x, Pn(ci, x))
    n = (ab(2) - ab(1))/h;
    xtr = linspace(ab(1), ab(2), n-1);
    %
    Itr = h*((Pn(ci, ab(1)) + Pn(ci, ab(2)))/2 + sum(Pn(ci, xtr)));
    xtr2 = linspace(ab(1), ab(2), 2*(n-1));
    Itr2 = h*((Pn(ci, ab(1)) + Pn(ci, ab(2)))/2 + sum(Pn(ci, xtr2)));
    Itr
    Itr2
    unc = 1/3*abs(Itr2 - Itr)
    
end

