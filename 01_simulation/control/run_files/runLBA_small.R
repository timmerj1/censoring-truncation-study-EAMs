library(EMC2)
load("./01_simulation/control/EMCs/sLBA_small.RData")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsLBA_small.RData")
save(s, file = "./01_simulation/control/EMCs/outLBA_small.RData")
