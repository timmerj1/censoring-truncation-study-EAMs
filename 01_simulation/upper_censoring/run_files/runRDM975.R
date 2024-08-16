library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sRDM975.RData")
sRDM975 <- fit(sRDM975, fileName = "./01_simulation/upper_censoring/run_files/tmpsRDM975.RData")
save(sRDM975, file = "./01_simulation/upper_censoring/EMCs/sRDM975.RData")
