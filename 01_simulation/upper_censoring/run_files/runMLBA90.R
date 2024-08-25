library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sMLBA90.RData")
sMLBA90 <- fit(sMLBA90, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsMLBA90.RData")
save(sMLBA90, file = "./01_simulation/upper_censoring/EMCs/sMLBA90.RData")
