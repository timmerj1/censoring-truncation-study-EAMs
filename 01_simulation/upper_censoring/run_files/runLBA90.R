library(EMC2)
load("./01_simulation/upper_censoring/EMCs/sLBA90.RData")
sLBA90 <- fit(sLBA90, fileName = "./01_simulation/upper_censoring/tmp_files/tmpsLBA90.RData")
save(sLBA90, file = "./01_simulation/upper_censoring/EMCs/sLBA90.RData")
