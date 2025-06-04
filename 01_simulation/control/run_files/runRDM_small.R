library(EMC2)
load("./01_simulation/control/EMCs/sRDM_small.Rdata")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsRDM_small.Rdata")
save(s, file = "./01_simulation/control/EMCs/outRDM_small.Rdata")
