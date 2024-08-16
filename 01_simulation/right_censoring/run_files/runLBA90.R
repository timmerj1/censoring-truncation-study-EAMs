library(EMC2)
load("sLBA90.RData")
sLBA90 <- fit(sLBA90, fileName = "01_simulation/right_censoring/run_files/tmpsLBA90.RData")
save(sLBA90, file = "sLBA90.RData")
