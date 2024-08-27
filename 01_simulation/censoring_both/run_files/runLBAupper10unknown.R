library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLBAupper10unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLBAupper10unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLBAupper10unknown.RData")
