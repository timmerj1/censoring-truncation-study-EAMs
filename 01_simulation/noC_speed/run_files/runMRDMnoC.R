library(EMC2)
load("./01_simulation/noC_speed/EMCs/sMRDMnoC.RData")

t1 <- Sys.time()
sMRDMnoC <- fit(sMRDMnoC, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMRDMnoC.RData")
t2 <- Sys.time()
sMRDM <- fit(sMRDM, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMRDMnoC.RData")
t3 <- Sys.time()

noC_check <- t2 - t1
C_check <- t3 - t2
save(sMRDMnoC, sMRDM, noC_check, C_check, file = "./01_simulation/noC_speed/EMCs/sMRDMnoC.RData")
