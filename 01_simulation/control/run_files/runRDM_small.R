library(EMC2)
load("./01_simulation/control/EMCs/sRDM_small.RData")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsRDM_small.RData")
save(s, file = "./01_simulation/control/EMCs/outRDM_small.RData")
