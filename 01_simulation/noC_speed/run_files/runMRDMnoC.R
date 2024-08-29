library(EMC2)
load("./01_simulation/noC_speed/EMCs/sMRDMnoC.RData")
sMRDMnoC <- fit(sMRDMnoC, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMRDMnoC.RData")
save(sMRDMnoC, file = "./01_simulation/noC_speed/EMCs/sMRDMnoC.RData")
