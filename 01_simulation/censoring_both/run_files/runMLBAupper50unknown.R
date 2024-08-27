library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAupper50unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAupper50unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAupper50unknown.RData")
