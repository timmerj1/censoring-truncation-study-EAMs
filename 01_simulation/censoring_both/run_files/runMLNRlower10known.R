library(EMC2)
load("./01_simulation/censoring_both/EMCs/sMLNRlower10known.RData")
s <- fit(s, fileName = "./01_simulation/censoring_both/tmp_files/tmpsMLNRlower10known.RData")
save(s, file = "./01_simulation/censoring_both/EMCs/sMLNRlower10known.RData")
