library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLBAlower50unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLBAlower50unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLBAlower50unknown.RData")
