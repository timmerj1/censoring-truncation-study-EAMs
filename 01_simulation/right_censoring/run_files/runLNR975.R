library(EMC2)
load("sLNR975.RData")
sLNR975 <- fit(sLNR975, fileName = "01_simulation/right_censoring/run_files/tmpsLNR975.RData")
save(sLNR975, file = "sLNR975.RData")
