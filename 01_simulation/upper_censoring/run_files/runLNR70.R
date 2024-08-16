library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sLNR70.RData")
sLNR70 <- fit(sLNR70, fileName = "./01_simulation/upper_censoring/run_files/tmpsLNR70.RData")
save(sLNR70, file = "./01_simulation/upper_censoring/EMCs/sLNR70.RData")
