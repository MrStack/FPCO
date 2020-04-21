function firstArrivals = main(dataset,ts,f0,w,rangeWindowSize,compfa)
filters = ConstructFilters(ts,f0,w);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,rangeWindowSize);
firstArrivals = AdaptiveThreshold(rangeMatrix,f0,ts)-bias-1+rangeLine;
acc = accuracyComparison(firstArrivals,compfa,15);
disp(['Accuracy:',num2str(acc)]);