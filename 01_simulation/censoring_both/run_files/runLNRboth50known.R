library(EMC2)
load("./01_simulation/censoring_both/EMCs/sLNRboth50known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsLNRboth50known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sLNRboth50known.RData")
