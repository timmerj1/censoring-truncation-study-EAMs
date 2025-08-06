library(EMC2)
load("./01_simulation/baseline/EMCs/sRDM_small.Rdata")
s <- fit(s, fileName = "./01_simulation/baseline/tmp_files/tmpsRDM_small.Rdata")
save(s, file = "./01_simulation/baseline/EMCs/outRDM_small.Rdata")
