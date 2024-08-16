library(EMC2)
load("sMLNR70.RData")
sMLNR70 <- fit(sMLNR70, fileName = "01_simulation/right_censoring/run_files/tmpsMLNR70.RData")
save(sMLNR70, file = "sMLNR70.RData")
