function results = Convolution(singleShotGather,filters)
filterCount = length(filters);
results = cell(size(filters));
for i = 1:filterCount
    results{i} = imfilter(singleShotGather,filters{i},'replicate');
end