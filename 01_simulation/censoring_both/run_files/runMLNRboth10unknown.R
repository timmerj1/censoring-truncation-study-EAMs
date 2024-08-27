library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLNRboth10unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLNRboth10unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLNRboth10unknown.RData")
