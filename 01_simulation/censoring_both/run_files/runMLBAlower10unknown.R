library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAlower10unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAlower10unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAlower10unknown.RData")
