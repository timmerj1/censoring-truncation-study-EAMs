library(EMC2)
load("./01_simulation/noC_speed/EMCs/sMLNRnoC.RData")

t1 <- Sys.time()
sMLNRnoC <- fit(sMLNRnoC, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMLNRnoC.RData")
t2 <- Sys.time()
sMLNR <- fit(sMLNR, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMLNRnoC.RData")
t3 <- Sys.time()

noC_check <- t2 - t1
C_check <- t3 - t2
save(sMLNRnoC, sMLNR, noC_check, C_check, file = "./01_simulation/noC_speed/EMCs/sMLNRnoC.RData")
