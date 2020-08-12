function x = parameterOptimization(dataset,compareFirstArrival)
FPCOLambda = @(input) FPCO(dataset,compareFirstArrival,input);
x = particleswarm(FPCOLambda,4,[0.001,8,5,10],[0.02,50,15,80]);
disp("ts:"+x(1)+" f0:"+x(2)+" w:"+x(3)+" rangeWindowSize:"+x(4));
disp("Accuracy:"+num2str(-FPCOLambda(x)*100)+"%");

function fitness = FPCO(dataset,compfa,input)
filters = ConstructFilters(input(1),input(2),input(3));
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,input(4));
firstArrivals = AdaptiveThreshold(rangeMatrix,input(2),input(1))-bias-1+rangeLine;
fitness = -accuracyComparison(firstArrivals,compfa,15);