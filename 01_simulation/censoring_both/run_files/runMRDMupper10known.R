library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMRDMupper10known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMRDMupper10known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMRDMupper10known.RData")
