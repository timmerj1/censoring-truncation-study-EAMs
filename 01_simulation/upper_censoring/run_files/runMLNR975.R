library(EMC2)
load("01_simulation/right_censoring/EMCs/sMLNR975.RData")
sMLNR975 <- fit(sMLNR975, fileName = "01_simulation/right_censoring/run_files/tmpsMLNR975.RData")
save(sMLNR975, file = "01_simulation/right_censoring/EMCs/sMLNR975.RData")
