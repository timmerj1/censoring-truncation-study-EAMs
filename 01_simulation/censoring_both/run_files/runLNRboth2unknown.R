library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLNRboth2unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLNRboth2unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLNRboth2unknown.RData")
