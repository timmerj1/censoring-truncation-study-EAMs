library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sMLNR70.RData")
sMLNR70 <- fit(sMLNR70, fileName = "./01_simulation/upper_censoring/run_files/tmpsMLNR70.RData")
save(sMLNR70, file = "./01_simulation/upper_censoring/EMCs/sMLNR70.RData")
