library(EMC2)
load("./01_simulation/censoring_both/EMCs/sRDMboth10known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsRDMboth10known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sRDMboth10known.RData")
