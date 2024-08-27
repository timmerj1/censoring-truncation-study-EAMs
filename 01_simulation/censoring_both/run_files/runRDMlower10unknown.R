library(EMC2)
load("./01_simulation/censoring_both/EMCs/sRDMlower10unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsRDMlower10unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sRDMlower10unknown.RData")
