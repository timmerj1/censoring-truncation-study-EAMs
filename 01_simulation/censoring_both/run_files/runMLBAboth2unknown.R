library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAboth2unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAboth2unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAboth2unknown.RData")
