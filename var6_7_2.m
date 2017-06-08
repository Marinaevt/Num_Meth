f1 = @(x)(sqrt(4.*x));
f2 = @(x)(x.^2./4);
x = linspace(0, 4.5, 50);
plot(x, f1(x), 'r', x, f2(x));
ab = [0 4];
h = (ab(2) - ab(1))/4;
n = (ab(2) - ab(1))/h;

xsym = linspace(ab(1)+h, ab(2)-h, n-1);
Isym = h/6*(f1(ab(1)) + f1(ab(2)) + 2*sum(f1(xsym)));
for i = 1:n-2
    Isym = Isym + 4*h/6*f1((xsym(i+1) + xsym(i))/2);
end

xsym2 = linspace(ab(1)+h, ab(2)-h, 2*n-1);
Isym2 = h/6*(f1(ab(1)) + f1(ab(2)) + 2*sum(f1(xsym2)));
for i = 1:n-2
    Isym2 = Isym2 + 4*h/6*f1((xsym2(i+1) + xsym2(i))/2);
end
xsym = linspace(ab(1)+h, ab(2)-h, n-1);
Isym1 = h/6*(f2(ab(1)) + f2(ab(2)) + 2*sum(f2(xsym)));
for i = 1:n-2
    Isym1 = Isym1 + 4*h/6*f2((xsym(i+1) + xsym(i))/2);
end

xsym2 = linspace(ab(1)+h, ab(2)-h, 2*n-1);
Isym22 = h/6*(f2(ab(1)) + f2(ab(2)) + 2*sum(f2(xsym2)));
for i = 1:n-2
    Isym22 = Isym22 + 4*h/6*f2((xsym2(i+1) + xsym2(i))/2);
end



unc = 1/3*abs((Isym2 - Isym22) - (Isym-Isym1));
while unc > 1e-8
    n = 2*n;
    xsym = linspace(ab(1)+h, ab(2)-h, n-1);
    Isym = h/6*(f1(ab(1)) + f1(ab(2)) + 2*sum(f1(xsym)));
    for i = 1:n-2
        Isym = Isym + 4*h/6*f1((xsym(i+1) + xsym(i))/2);
    end

    xsym2 = linspace(ab(1)+h, ab(2)-h, 2*n-1);
    Isym2 = h/6*(f1(ab(1)) + f1(ab(2)) + 2*sum(f1(xsym2)));
    for i = 1:n-2
        Isym2 = Isym2 + 4*h/6*f1((xsym2(i+1) + xsym2(i))/2);
    end
    xsym = linspace(ab(1)+h, ab(2)-h, n-1);
    Isym1 = h/6*(f2(ab(1)) + f2(ab(2)) + 2*sum(f2(xsym)));
    for i = 1:n-2
        Isym1 = Isym1 + 4*h/6*f2((xsym(i+1) + xsym(i))/2);
    end

    xsym2 = linspace(ab(1)+h, ab(2)-h, 2*n-1);
    Isym22 = h/6*(f2(ab(1)) + f2(ab(2)) + 2*sum(f2(xsym2)));
    for i = 1:n-2
        Isym22 = Isym22 + 4*h/6*f2((xsym2(i+1) + xsym2(i))/2);
    end



    unc = 1/3*abs((Isym2 - Isym22) - (Isym-Isym1))
    
    
    %unc = 1/3*abs(Isym2 - Isym)
end