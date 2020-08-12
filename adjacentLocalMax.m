function indices = adjacentLocalMax(indices,rangeMatrix)
[m,n] = size(rangeMatrix);
for j = 1:n-1
    if indices(j) >= m
        continue;
    end
    while rangeMatrix(indices(j),j) < rangeMatrix(indices(j)+1,j)        
        indices(j) = indices(j)+1;
        if indices(j) >= m
            break;
        end
    end
end