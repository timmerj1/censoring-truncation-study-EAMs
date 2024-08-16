library(EMC2)
load("01_simulation/right_censoring/EMCs/sMLBA975.RData")
sMLBA975 <- fit(sMLBA975, fileName = "01_simulation/right_censoring/run_files/tmpsMLBA975.RData")
save(sMLBA975, file = "01_simulation/right_censoring/EMCs/sMLBA975.RData")
