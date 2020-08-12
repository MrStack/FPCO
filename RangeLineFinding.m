function R = RangeLineFinding(convResults,dc)
n = size(convResults{1},2);
resultsCount = length(convResults);
W = zeros(resultsCount,n);
for i = 1:resultsCount
    for j = 1:n
        [ignore,W(i,j)] = max(convResults{i}(:,j));
    end
end
P = zeros(18,n);
for k = 1:n
    dist = pdist(W(:,k),'cityblock');
    dist = -(squareform(dist)/dc).^2;
    P(:,k) = sum(exp(dist),2);
end
[ignore,R] = max(P);

for k = 1:n
    T = W(:,k);
    R(k) = T(R(k));
end
   
