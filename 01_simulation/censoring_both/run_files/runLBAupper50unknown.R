library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLBAupper50unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLBAupper50unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLBAupper50unknown.RData")
