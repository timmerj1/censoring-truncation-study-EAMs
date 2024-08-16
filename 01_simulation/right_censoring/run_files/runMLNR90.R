library(EMC2)
load("sMLNR90.RData")
sMLNR90 <- fit(sMLNR90, fileName = "01_simulation/right_censoring/run_files/tmpsMLNR90.RData")
save(sMLNR90, file = "sMLNR90.RData")
