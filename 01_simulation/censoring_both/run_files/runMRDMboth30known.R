library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMRDMboth30known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMRDMboth30known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMRDMboth30known.RData")
