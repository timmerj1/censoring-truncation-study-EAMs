library(EMC2)
load("01_simulation/right_censoring/EMCs/sRDM70.RData")
sRDM70 <- fit(sRDM70, fileName = "01_simulation/right_censoring/run_files/tmpsRDM70.RData")
save(sRDM70, file = "01_simulation/right_censoring/EMCs/sRDM70.RData")
