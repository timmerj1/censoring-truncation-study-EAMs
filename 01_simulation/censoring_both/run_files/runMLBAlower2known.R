library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAlower2known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAlower2known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAlower2known.RData")
