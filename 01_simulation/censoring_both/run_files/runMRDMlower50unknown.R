library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMRDMlower50unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMRDMlower50unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMRDMlower50unknown.RData")
