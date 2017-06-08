ab = [1 1.44];
c = [6.8 1.7 -4.1 0.1 -6.1];
I = @(ab)(c(1)*ab(2) - c(1)*ab(1) + c(2)*ab(2)^2/2 - c(2)*ab(1)^2/2 + ...
c(3)*ab(2)^3/3 - c(3)*ab(1)^3/3 + c(4)*ab(2)^4/4 - c(4)*ab(1)^4/4 + c(5)*ab(2)^5/5 - c(5)*ab(1)^5/5);
Ian = I(ab);
Pn = @(c, x)(c(1) + c(2).*x + c(3).*x.^2 + c(4).*x.^3 + c(5).*x.^4);
xii = (ab(2) - ab(1))/2;
%
Itrf = (ab(2) - ab(1))/2*(Pn(c, ab(1)) + Pn(c, ab(2))) - (ab(2) - ab(1))^2/12*(2*c(3) + 3*2*c(4)*xii + 4*3*c(5)*xii^2);
%
Isif = (ab(2) - ab(1))/6*(Pn(c, ab(1)) + 4*Pn(c, (ab(1) + ab(2))/2) + Pn(c, ab(2)));


P1 = @(c, x)(c(2) + 2*c(3).*x + 3*c(4).*x.^2 + 4*c(5).*x.^3);
P2 = @(c, x)(2*c(3) + 3*2*c(4).*x + 4*3*c(5).*x.^2);
P4 = @(c, x)(4*3*2*c(5));
x = linspace(ab(1), ab(2), 50);
% plot(x, P1(c, x))
M1 = max(abs(P1(c, x)));
M2 = max(abs(P2(c, x)));
M4 = max(abs(P4(c, x)));
R = 0.0001;
hlrp = 2*R/(M1*(ab(2) - ab(1)));
hcp = sqrt(24*R/(M2*(ab(2) - ab(1))));
htrap = sqrt(12*R/(M2*(ab(2) - ab(1))));
hsym = nthroot(2880*R/(M4*(ab(2) - ab(1))), 4);

%lrp
n = (ab(2) - ab(1))/hlrp;
xlp = linspace(ab(1), ab(2), n-1);
%
Ilp = hlrp*sum(Pn(c, xlp));
xrp = linspace(ab(1), ab(2), n);
%
Irp = hlrp*sum(Pn(c, xrp));

%cp
n = (ab(2) - ab(1))/hcp;
xcp = linspace(ab(1), ab(2), n-1);
%
Icp = 0;
for i = 1:n-2
    Icp = Icp + hcp*(Pn(c, (xcp(i+1) + xcp(i))/2));
end

%trap
n = (ab(2) - ab(1))/htrap;
xtr = linspace(ab(1), ab(2), n-1);
%
Itr = htrap*((Pn(c, ab(1)) + Pn(c, ab(2)))/2 + sum(Pn(c, xtr)));

%sym
n = (ab(2) - ab(1))/hsym;
xsym = linspace(ab(1), ab(2), n-1);
Isym = hsym/6*(Pn(c, ab(1)) + Pn(c, ab(2)) + 2*sum(Pn(c, xsym)));
for i = 1:n-1
    Isym = Isym + 4*hsym/6*Pn(c, (xsym(i+1) + xsym(i))/2);
end


