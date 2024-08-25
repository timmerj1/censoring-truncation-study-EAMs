library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sLBA975.RData")
sLBA975 <- fit(sLBA975, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsLBA975.RData")
save(sLBA975, file = "./01_simulation/upper_censoring/EMCs/sLBA975.RData")
