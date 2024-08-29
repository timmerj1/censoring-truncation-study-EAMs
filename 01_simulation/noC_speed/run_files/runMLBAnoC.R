library(EMC2)
load("./01_simulation/noC_speed/EMCs/sMLBAnoC.RData")
sMLBAnoC <- fit(sMLBAnoC, fileName = "./01_simulation/noC_speed/tmp_files/tmpsMLBAnoC.RData")
save(sMLBAnoC, file = "./01_simulation/noC_speed/EMCs/sMLBAnoC.RData")
