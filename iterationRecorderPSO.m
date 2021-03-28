function stop = iterationRecorderPSO(optimValues,state,iterationSize)
persistent records;
persistent xDimensions;
stop = false;
switch state
    case 'init'
        if isempty(xDimensions)
            xDimensions = length(optimValues.bestx);
        end
        
        if isempty(records)
            records = zeros(xDimensions+2,iterationSize);
        end
    case 'iter'
        iter = optimValues.iteration;
        records(1:xDimensions,iter) = optimValues.bestx;
        records(xDimensions+1,iter) = optimValues.bestfval;
        records(xDimensions+2,iter) = iter;
    case 'done'
        records = cutRecords(records);
        disp("Saving the PSO records...");
        write2xlsx(records','PSOrecords.xlsx');
        disp("Visualizing PSO records...");
        visualizeSearchingProcess(records,"FPCO");
        disp("Done.");
        clear records xDimensions;
end