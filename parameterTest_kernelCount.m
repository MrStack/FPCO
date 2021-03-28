function [kc,ac] = parameterTest_kernelCount(dataset,mannualFirstArrivals,P,kernelCount)
kc = 2:kernelCount;
ac = zeros(size(kc));
for i = 1:length(kc)    
    fitness = -FPCO(dataset,mannualFirstArrivals,P,kc(i));
    ac(i) = fitness*100;
    disp("ts:"+P.ts+" f0:"+P.f0+" w:"+P.w+" rangeWindowSize:"+P.rw);
    disp("Kernel count:"+kc(i));
    disp("Accuracy:"+num2str(fitness*100)+"%");
end
figure;plot(kc,ac);
axis('auto');
title('Parameter test of kernel count');
ylabel('Accuracy(%)');
xlabel('Kernel Count');

function fitness = FPCO(dataset,compfa,P,kc)
filters = ConstructFilters(P.ts,P.f0,P.w,kc);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,P.rw);
firstArrivals = AdaptiveThreshold(rangeMatrix,P.f0,P.ts)-bias-1+rangeLine;
fitness = -accuracyComparison(firstArrivals,compfa,15);