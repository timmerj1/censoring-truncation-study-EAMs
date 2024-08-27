library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAlower2unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAlower2unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAlower2unknown.RData")
