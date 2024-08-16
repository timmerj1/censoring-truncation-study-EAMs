library(EMC2)
load("sLNR90.RData")
sLNR90 <- fit(sLNR90, fileName = "01_simulation/right_censoring/run_files/tmpsLNR90.RData")
save(sLNR90, file = "sLNR90.RData")
