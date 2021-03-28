function [beta,ac] = parameterTest_beta(dataset,mannualFirstArrivals,P,beta_range)
beta = beta_range(1):beta_range(2);
ac = zeros(size(beta));
for i = 1:length(beta)    
    fitness = -FPCO(dataset,mannualFirstArrivals,P,beta(i));
    ac(i) = fitness*100;
    disp("ts:"+P.ts+" f0:"+P.f0+" w:"+P.w+" rangeWindowSize:"+P.rw);
    disp("beta:"+beta(i));
    disp("Accuracy:"+num2str(fitness*100)+"%");
end

figure;plot(beta,ac);
title('Parameter test of \beta');
ylabel('Accuracy(%)');
xlabel('\beta');


function fitness = FPCO(dataset,compfa,P,beta)
filters = ConstructFilters(P.ts,P.f0,P.w,18);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,beta);
firstArrivals = AdaptiveThreshold(rangeMatrix,P.f0,P.ts)-bias-1+rangeLine;
fitness = -accuracyComparison(firstArrivals,compfa,15);