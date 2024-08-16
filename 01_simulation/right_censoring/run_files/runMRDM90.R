library(EMC2)
load("sMRDM90.RData")
sMRDM90 <- fit(sMRDM90, fileName = "01_simulation/right_censoring/run_files/tmpsMRDM90.RData")
save(sMRDM90, file = "sMRDM90.RData")
