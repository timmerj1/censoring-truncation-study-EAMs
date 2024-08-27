library(EMC2)
load("./01_simulation/censoring_both/EMCs/sRDMlower50known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsRDMlower50known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sRDMlower50known.RData")
