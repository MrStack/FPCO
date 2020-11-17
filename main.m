function firstArrivals = main(dataset,ts,f0,w,rangeWindowSize)
filters = ConstructFilters(ts,f0,w);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,rangeWindowSize);
firstArrivals = AdaptiveThreshold(rangeMatrix,f0,ts)-bias-1+rangeLine;
figure;hold on;
drawFirstArrivals(dataset,firstArrivals,1,'r','o',5);
