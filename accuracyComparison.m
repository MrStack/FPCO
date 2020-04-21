function accuracy = accuracyComparison(firstArrivals,compFirstArrivals,tolerance)
accuracy = sum(abs(firstArrivals-compFirstArrivals) < tolerance)/length(firstArrivals);