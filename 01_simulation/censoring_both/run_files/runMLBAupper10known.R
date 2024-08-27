library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAupper10known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAupper10known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAupper10known.RData")
