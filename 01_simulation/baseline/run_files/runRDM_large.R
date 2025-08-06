library(EMC2)
load("./01_simulation/baseline/EMCs/sRDM_large.Rdata")
s <- fit(s, fileName = "./01_simulation/baseline/tmp_files/tmpsRDM_large.Rdata")
save(s, file = "./01_simulation/baseline/EMCs/outRDM_large.Rdata")
