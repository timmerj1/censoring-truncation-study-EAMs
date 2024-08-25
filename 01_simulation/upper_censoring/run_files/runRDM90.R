library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sRDM90.RData")
sRDM90 <- fit(sRDM90, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsRDM90.RData")
save(sRDM90, file = "./01_simulation/upper_censoring/EMCs/sRDM90.RData")
