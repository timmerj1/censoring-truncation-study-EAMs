library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sMRDM70.RData")
sMRDM70 <- fit(sMRDM70, fileName = "./01_simulation/upper_censoring/run_files/tmpsMRDM70.RData")
save(sMRDM70, file = "./01_simulation/upper_censoring/EMCs/sMRDM70.RData")
