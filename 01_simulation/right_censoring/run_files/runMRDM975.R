library(EMC2)
load("sMRDM975.RData")
sMRDM975 <- fit(sMRDM975, fileName = "01_simulation/right_censoring/run_files/tmpsMRDM975.RData")
save(sMRDM975, file = "sMRDM975.RData")
