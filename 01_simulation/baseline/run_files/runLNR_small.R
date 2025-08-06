library(EMC2)
load("./01_simulation/baseline/EMCs/sLNR_small.Rdata")
s <- fit(s, fileName = "./01_simulation/baseline/tmp_files/tmpsLNR_small.Rdata")
save(s, file = "./01_simulation/baseline/EMCs/outLNR_small.Rdata")
