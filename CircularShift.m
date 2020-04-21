function Ctheta = CircularShift(C0,Htheta,l,w)
Ctheta = zeros(l,w);
for j = 1:w
    for i = 1:l
        Ctheta(i,j) = C0(mod((i+Htheta(j)),l)+1,j);
    end
end