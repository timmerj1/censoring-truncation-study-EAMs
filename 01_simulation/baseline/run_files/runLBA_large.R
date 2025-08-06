library(EMC2)
load("./01_simulation/baseline/EMCs/sLBA_large.Rdata")
s <- fit(s, fileName = "./01_simulation/baseline/tmp_files/tmpsLBA_large.Rdata")
save(s, file = "./01_simulation/baseline/EMCs/outLBA_large.Rdata")
