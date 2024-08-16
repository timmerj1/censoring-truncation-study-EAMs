library(EMC2)
load("01_simulation/right_censoring/EMCs/sLNR90.RData")
sLNR90 <- fit(sLNR90, fileName = "01_simulation/right_censoring/run_files/tmpsLNR90.RData")
save(sLNR90, file = "01_simulation/right_censoring/EMCs/sLNR90.RData")
