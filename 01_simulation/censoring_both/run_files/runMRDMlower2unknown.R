library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMRDMlower2unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMRDMlower2unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMRDMlower2unknown.RData")
