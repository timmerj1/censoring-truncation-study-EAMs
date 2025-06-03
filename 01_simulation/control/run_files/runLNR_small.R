library(EMC2)
load("./01_simulation/control/EMCs/sLNR_small.RData")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsLNR_small.RData")
save(s, file = "./01_simulation/control/EMCs/outLNR_small.RData")
