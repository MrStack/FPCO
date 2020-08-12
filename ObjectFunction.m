function f = ObjectFunction(indices,rangeMatrix)
secondOrderDiff = diff(indices,2);
linearIndices = 0:size(rangeMatrix,2)-1;
linearIndices = linearIndices*size(rangeMatrix,1)+indices;
energy = rangeMatrix(round(linearIndices));
if sum(abs(secondOrderDiff)) <= 0
    f = Inf;
    return;
end
f = sum(abs(secondOrderDiff))/(sum(energy)*10);