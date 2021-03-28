function DemoMain(syntheticData)
load(syntheticData, 'dataset', 'manualPicks', 'P');
tolerance = 15;
disp("Trained parameters:");
P %#ok<NOPRT>
disp("Running FPCO...");
firstArrivals = FPCO_Main(dataset,P);
disp("Done.");
disp("Accuracy:"+accuracyComparison(firstArrivals,manualPicks,tolerance)*100+"%");
figure;drawFirstArrivals(dataset,firstArrivals);