library(EMC2)
load("sLNR70.RData")
sLNR70 <- fit(sLNR70, fileName = "01_simulation/right_censoring/run_files/tmpsLNR70.RData")
save(sLNR70, file = "sLNR70.RData")
