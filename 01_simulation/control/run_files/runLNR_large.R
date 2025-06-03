library(EMC2)
load("./01_simulation/control/EMCs/sLNR_large.RData")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsLNR_large.RData")
save(s, file = "./01_simulation/control/EMCs/outLNR_large.RData")
