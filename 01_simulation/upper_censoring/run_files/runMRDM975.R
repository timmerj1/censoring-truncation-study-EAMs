library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sMRDM975.RData")
sMRDM975 <- fit(sMRDM975, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsMRDM975.RData")
save(sMRDM975, file = "./01_simulation/upper_censoring/EMCs/sMRDM975.RData")
