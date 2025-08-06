library(EMC2)
load("./01_simulation/baseline/EMCs/sLBA_small.Rdata")
s <- fit(s, fileName = "./01_simulation/baseline/tmp_files/tmpsLBA_small.Rdata")
save(s, file = "./01_simulation/baseline/EMCs/outLBA_small.Rdata")
