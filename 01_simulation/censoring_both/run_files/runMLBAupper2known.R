library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAupper2known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAupper2known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAupper2known.RData")
