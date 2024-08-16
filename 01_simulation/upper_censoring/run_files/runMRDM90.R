library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sMRDM90.RData")
sMRDM90 <- fit(sMRDM90, fileName = "./01_simulation/upper_censoring/run_files/tmpsMRDM90.RData")
save(sMRDM90, file = "./01_simulation/upper_censoring/EMCs/sMRDM90.RData")
