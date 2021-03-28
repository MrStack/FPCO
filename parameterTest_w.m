function [w,ac] = parameterTest_w(dataset,mannualFirstArrivals,P,w_range)
w = w_range(1):w_range(2);
ac = zeros(size(w));
for i = 1:length(w)
    P.w = w(i);    
    fitness = -FPCO(dataset,mannualFirstArrivals,P);
    ac(i) = fitness*100;
    disp("ts:"+P.ts+" f0:"+P.f0+" w:"+w(i)+" rangeWindowSize:"+P.rw);
    disp("Accuracy:"+num2str(fitness*100)+"%");
end

figure;plot(w,ac);
title('Parameter test of w');
ylabel('Accuracy(%)');
xlabel('w');

function fitness = FPCO(dataset,compfa,P)
filters = ConstructFilters(P.ts,P.f0,P.w,18);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,P.rw);
firstArrivals = AdaptiveThreshold(rangeMatrix,P.f0,P.ts)-bias-1+rangeLine;
fitness = -accuracyComparison(firstArrivals,compfa,15);