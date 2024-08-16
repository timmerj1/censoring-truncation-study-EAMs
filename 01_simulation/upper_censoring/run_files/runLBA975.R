library(EMC2)
load("01_simulation/right_censoring/EMCs/sLBA975.RData")
sLBA975 <- fit(sLBA975, fileName = "01_simulation/right_censoring/run_files/tmpsLBA975.RData")
save(sLBA975, file = "01_simulation/right_censoring/EMCs/sLBA975.RData")
