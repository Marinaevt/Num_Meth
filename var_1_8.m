d = [];
p = [];
for m = 4:8
    sn = 0;
    s = 13 + 1*10^(-m);
    for n = 0:10000
        sn = sn + round(36/(n^2 + 7*n + 10)*10^m)/10^m;
    end
    d = [d;round(abs(sn - s)*10^m)/10^m];
    p = [p; round(d(m-3)/s*10^m)/10^m]
end
plot([4, 5, 6, 7, 8], p, 'ro--')