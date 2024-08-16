library(EMC2)
load("sMLBA90.RData")
sMLBA90 <- fit(sMLBA90, fileName = "01_simulation/right_censoring/run_files/tmpsMLBA90.RData")
save(sMLBA90, file = "sMLBA90.RData")
