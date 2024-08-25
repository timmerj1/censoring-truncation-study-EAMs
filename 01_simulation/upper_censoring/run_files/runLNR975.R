library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sLNR975.RData")
sLNR975 <- fit(sLNR975, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsLNR975.RData")
save(sLNR975, file = "./01_simulation/upper_censoring/EMCs/sLNR975.RData")
