library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLNRlower2unknown.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLNRlower2unknown.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLNRlower2unknown.RData")
