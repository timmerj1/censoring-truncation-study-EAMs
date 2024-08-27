library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLBAupper2unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLBAupper2unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLBAupper2unknown.RData")
