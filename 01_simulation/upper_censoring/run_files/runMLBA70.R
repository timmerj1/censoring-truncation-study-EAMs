library(EMC2)
load("01_simulation/right_censoring/EMCs/sMLBA70.RData")
sMLBA70 <- fit(sMLBA70, fileName = "01_simulation/right_censoring/run_files/tmpsMLBA70.RData")
save(sMLBA70, file = "01_simulation/right_censoring/EMCs/sMLBA70.RData")
