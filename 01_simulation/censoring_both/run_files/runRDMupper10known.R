library(EMC2)
load("./01_simulation/censoring_both/EMCs/sRDMupper10known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsRDMupper10known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sRDMupper10known.RData")
