function Filters = ConstructFilters(ts,f0,w,kernelCount)
w = round(w);
step = 180/kernelCount;
theta = 0:step:180-step;
Filters = cell(1,kernelCount);
for i = 1:length(Filters)
    if abs(theta(i)-90) < 1e-4
        Filters{i} = NinetyDegreeFilter(ts,f0,w);
        continue;
    end
    Filters{i} = FilterConstruction(ts,f0,w,theta(i));    
end

function C90 = NinetyDegreeFilter(ts,f0,w)
halfCycle = 1/(2*f0*ts);
Y = zeros(round(halfCycle)+1,1);
for i = 1:length(Y)
    Y(i) = sin(2*pi*f0*ts*(i-1));
end
Z = zeros(round(halfCycle)+1,1);
S = [Z;Y;Z];
l = 3*round(halfCycle+1);
C90 = zeros(l,w);
C90(:,round(w/2)) = S;