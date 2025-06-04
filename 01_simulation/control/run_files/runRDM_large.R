library(EMC2)
load("./01_simulation/control/EMCs/sRDM_large.Rdata")
s <- fit(s, fileName = "./01_simulation/control/tmp_files/tmpsRDM_large.Rdata")
save(s, file = "./01_simulation/control/EMCs/outRDM_large.Rdata")
