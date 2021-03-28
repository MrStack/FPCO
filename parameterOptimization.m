function P = parameterOptimization(dataset,compareFirstArrival)
ts = 0.004;
FPCOLambda = @(input) FPCO(dataset,compareFirstArrival,ts,input);
x = particleswarm(FPCOLambda,3,[5,5,40],[50,20,80]);
disp("ts:"+ts+" f0:"+x(1)+" w:"+x(2)+" rangeWindowSize:"+x(3));
disp("Accuracy:"+num2str(-FPCOLambda(x)*100)+"%");

P.ts = ts;P.f0 = x(1);P.w = x(2);P.rw = x(3);

function fitness = FPCO(dataset,compfa,ts,input)
filters = ConstructFilters(ts,input(1),input(2),18);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,input(3));
firstArrivals = AdaptiveThreshold(rangeMatrix,input(1),0.004)-bias-1+rangeLine;
fitness = -accuracyComparison(firstArrivals,compfa,15);