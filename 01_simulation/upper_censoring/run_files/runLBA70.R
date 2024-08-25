library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sLBA70.RData")
sLBA70 <- fit(sLBA70, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsLBA70.RData")
save(sLBA70, file = "./01_simulation/upper_censoring/EMCs/sLBA70.RData")
