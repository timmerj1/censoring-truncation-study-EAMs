library(EMC2)
load("sRDM90.RData")
sRDM90 <- fit(sRDM90, fileName = "01_simulation/right_censoring/run_files/tmpsRDM90.RData")
save(sRDM90, file = "sRDM90.RData")
