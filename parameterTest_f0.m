function [f0,ac] = parameterTest_f0(dataset,mannualFirstArrivals,P,f0_range,f0_step)
f0 = f0_range(1):f0_step:f0_range(2);
ac = zeros(size(f0));
for i = 1:length(f0)    
    fitness = -FPCO(dataset,mannualFirstArrivals,P,f0(i));
    ac(i) = fitness*100;
    disp("ts:"+P.ts+" f0:"+P.f0+" w:"+P.w+" rangeWindowSize:"+P.rw);
    disp("f0:"+f0(i));
    disp("Accuracy:"+num2str(fitness*100)+"%");
end

figure;plot(f0,ac);
title('Parameter test of f_0');
ylabel('Accuracy(%)');
xlabel('f_0');

function fitness = FPCO(dataset,compfa,P,f0)
filters = ConstructFilters(P.ts,f0,P.w,18);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,P.rw);
firstArrivals = AdaptiveThreshold(rangeMatrix,f0,P.ts)-bias-1+rangeLine;
fitness = -accuracyComparison(firstArrivals,compfa,15);