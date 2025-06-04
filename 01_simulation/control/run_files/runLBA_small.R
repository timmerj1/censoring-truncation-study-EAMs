library(EMC2)
load("./01_simulation/control/EMCs/sLBA_small.Rdata")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsLBA_small.Rdata")
save(s, file = "./01_simulation/control/EMCs/outLBA_small.Rdata")
