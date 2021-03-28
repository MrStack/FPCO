function visualizeSearchingProcess(records,algorithmName)
rescaled = rescaleRecords(records(2:4,:));
figure;plot(rescaled');
legend("f_0","w","\beta");
xlabel("Iterations");
title("Training process of "+algorithmName);

figure;plot(records(5,:));
legend("fitness");
xlabel("Iterations");
ylabel("Score");
title("Training process of "+algorithmName);