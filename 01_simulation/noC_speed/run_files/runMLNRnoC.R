library(EMC2)
load("./01_simulation/noC_speed/EMCs/sMLNRnoC.RData")
sMLNRnoC <- fit(sMLNRnoC, fileName = "./01_simulation/noC_speed/run_files/tmpsMLNRnoC.RData")
save(sMLNRnoC, file = "./01_simulation/noC_speed/EMCs/sMLNRnoC.RData")
