library(EMC2)
load("./01_simulation/control/EMCs/sLNR_small.Rdata")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsLNR_small.Rdata")
save(s, file = "./01_simulation/control/EMCs/outLNR_small.Rdata")
