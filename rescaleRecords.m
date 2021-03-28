function rescaled = rescaleRecords(records)
rescaled = mapminmax(records,0,1);