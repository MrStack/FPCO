function firstArrivals = FPCO_Main(dataset,ts,f0,w,rangeWindowSize)
%This snippet is for test convenience
if nargin == 2
    if isstruct(ts)
        f0 = ts.f0;
        w = ts.w;
        rangeWindowSize = ts.rw;
        ts = ts.ts;
    end
end

tic;
filters = ConstructFilters(ts,f0,w,18);
convResults = Convolution(dataset,filters);
rangeLine = RangeLineFinding(convResults,1);
[rangeMatrix,bias] = extractRangeMatrix(dataset,rangeLine,rangeWindowSize);
firstArrivals = AdaptiveThreshold(rangeMatrix,0,0)-bias-1+rangeLine;
toc;
