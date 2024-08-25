library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sMLNR90.RData")
sMLNR90 <- fit(sMLNR90, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsMLNR90.RData")
save(sMLNR90, file = "./01_simulation/upper_censoring/EMCs/sMLNR90.RData")
