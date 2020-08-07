function records = AdaptiveThreshold(rangeMatrix,f0,ts)
minEnergy = min(rangeMatrix,[],'all');
maxEnergy = max(rangeMatrix,[],'all');
stepSize = 0.05;
energy = minEnergy:stepSize:maxEnergy;
records = zeros(length(energy),size(rangeMatrix,2));
for i = 1:length(energy)
    for j = 1:size(rangeMatrix,2)
        records(i,j) = lastLessThan(rangeMatrix(:,j),energy(i)-1);
    end
end
records = records(evaluation(records,rangeMatrix),:);
records = adjacentLocalMax(records,rangeMatrix);

function index = lastLessThan(colomn,energy)
for i = 1:size(colomn,1)
    if colomn(i) > energy
        index = i-1;    
        return;
    end
end
index = 1;

function bestIndex = evaluation(records,rangeMatrix)
evals = zeros(size(records,1),1);
for i = 1:length(evals)
    evals(i) = ObjectFunction(records(i,:),rangeMatrix);
end
[ignore,bestIndex] = min(evals);
