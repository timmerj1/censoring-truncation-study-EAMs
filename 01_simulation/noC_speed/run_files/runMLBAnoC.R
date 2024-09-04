library(EMC2)
load("./01_simulation/noC_speed/EMCs/sMLBAnoC.RData")

t1 <- Sys.time()
sMLBA <- fit(sMLBA, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMLBA.RData")
t2 <- Sys.time()
sMLBAnoC <- fit(sMLBAnoC, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMLBAnoC.RData")
t3 <- Sys.time()
noC_check <- t2 - t1
C_check <- t3 - t2
save(sMLBAnoC, sMLBA, noC_check, C_check, file = "./01_simulation/noC_speed/EMCs/sMLBAnoC.RData")
