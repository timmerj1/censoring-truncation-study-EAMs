library(EMC2)
load("sMLBA975.RData")
sMLBA975 <- fit(sMLBA975, fileName = "01_simulation/right_censoring/run_files/tmpsMLBA975.RData")
save(sMLBA975, file = "sMLBA975.RData")
