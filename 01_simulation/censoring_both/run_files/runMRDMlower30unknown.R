library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMRDMlower30unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMRDMlower30unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMRDMlower30unknown.RData")
