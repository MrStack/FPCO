function Ctheta = FilterConstruction(ts,f0,w,theta)
halfCycle = 1/(2*f0*ts);
Y = zeros(round(halfCycle)+1,1);
for i = 1:length(Y)
    Y(i) = sin(2*pi*f0*ts*(i-1));
end
Z = zeros(round((halfCycle+1)*1),1);
S = [Z;Y;Z];
l = 3*round(halfCycle+1);
C0 = zeros(l,w);
for j = 1:w
    C0(:,j) = S;
end
X = -(w/2):(w/2);
Htheta = floor(tan(deg2rad(theta))*X);
Ctheta = CircularShift(C0,Htheta,l,w);
