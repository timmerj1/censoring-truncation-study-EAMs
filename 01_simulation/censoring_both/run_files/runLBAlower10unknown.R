library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLBAlower10unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLBAlower10unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLBAlower10unknown.RData")
