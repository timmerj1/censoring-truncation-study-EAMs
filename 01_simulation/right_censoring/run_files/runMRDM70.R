library(EMC2)
load("sMRDM70.RData")
sMRDM70 <- fit(sMRDM70, fileName = "01_simulation/right_censoring/run_files/tmpsMRDM70.RData")
save(sMRDM70, file = "sMRDM70.RData")
