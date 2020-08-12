function firstArrivals = main(dataset,ts,f0,w,rangeWindowSize,compfa)
filters = ConstructFilters(ts,f0,w);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
% rangeWindowSize = 31;
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,rangeWindowSize);
firstArrivals = AdaptiveThreshold(rangeMatrix,f0,ts)-bias-1+rangeLine;
acc = accuracyComparison(firstArrivals,compfa,15);
disp(['Accuracy:',num2str(acc)]);
figure;hold on;
% drawFirstArrivals(dataset,rangeLine,1,'g','^',5);
drawFirstArrivals(dataset,firstArrivals,1,'r','o',5);
% drawFirstArrivals(dataset,compfa,0,'b','^',5);