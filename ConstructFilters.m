function Filters = ConstructFilters(ts,f0,w)
w = round(w);
theta = 0:10:170;
Filters = cell(1,18);
for i = 1:18
    if theta(i) == 90
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