library(EMC2)
load("./01_simulation/control/EMCs/sRDM_large.RData")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsRDM_large.RData")
save(s, file = "./01_simulation/control/EMCs/outRDM_large.RData")
