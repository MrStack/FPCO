function [dc,ac] = parameterTest_dc(dataset,mannualFirstArrivals,P,dc_range,dc_step)
dc = dc_range(1):dc_step:dc_range(2);
ac = zeros(size(dc));
for i = 1:length(dc)    
    fitness = -FPCO(dataset,mannualFirstArrivals,P,dc(i));
    ac(i) = fitness*100;
    disp("ts:"+P.ts+" f0:"+P.f0+" w:"+P.w+" rangeWindowSize:"+P.rw);
    disp("dc:"+dc(i));
    disp("Accuracy:"+num2str(fitness*100)+"%");
end

figure;plot(dc,ac);
title('Parameter test of d_c');
ylabel('Accuracy(%)');
xlabel('d_c');

function fitness = FPCO(dataset,compfa,P,dc)
filters = ConstructFilters(P.ts,P.f0,P.w,18);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,dc);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,P.rw);
firstArrivals = AdaptiveThreshold(rangeMatrix,P.f0,P.ts)-bias-1+rangeLine;
fitness = -accuracyComparison(firstArrivals,compfa,15);